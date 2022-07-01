Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A35ECCA486
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.39310.1656687063013338220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BiB3yT+C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181ba3e7218-148134b8-6414-4de1-b2c6-4eb2d306b11d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/uWgPjqqV1g1rfepjdpCwLPW5fqlqb+tqlTOoY9dMig=;
	b=BiB3yT+C8gk1o9y0tM4HnEo39cDNuGd5tmHzqEUSkZq1RNS8qsj6CRs66NamvQdK
	QYffTKPx/qDSx5fWpIzpzPAMwqDILa+wtusXuW9BVfIqzpSXSqaoJRr06suXis5+ZFI
	gscv03UmGnP+Ili7ZZ6ViWpccYccrKhj9mVVYuUY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/uWgPjqqV1g1rfepjdpCwLPW5fqlqb+tqlTOoY9dMig=;
	b=kVzciHh0jkFMWikqjjwwxZ8VY0r7no98KylrXOfwLVWqe+d75HQ+p8vW34CNjvG2
	KNk3uYXm011J98ICGhpradLzvFNZo+5jsdWOQxRw+a7ZSi8qHDTG20p3aNsIqzkk2Jd
	RcO6rrZoFHcEPEAeuulDkiPqR2m82Ti8IlkqE1H4=
Content-Type: multipart/mixed; boundary="===============1201863840076941612=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.20.3 SUCCEEDED
Message-ID: 
 <01010181ba3e7218-148134b8-6414-4de1-b2c6-4eb2d306b11d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167524

--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.20.2-1.20.3.patch
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
--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47e13c9d990eca0f16664da9e59ffe05d5a170fc"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47e13c9d990eca0f16664da9e59ffe05d5a170fc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 13 Mirrors 0 Missed 73 Current 608 (15% match, 89% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 618 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1284 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-base/1.20.2-r0/temp/log.do_packagedata_setscene.2362600
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 693 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_package_setscene)
NOTE: Running task 1860 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1867 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1868 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1869 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1917 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1920 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1921 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1922 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1987 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_fetch)
NOTE: Running task 2016 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_fetch)
NOTE: Running task 2043 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_fetch)
NOTE: Running task 2044 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2046 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2052 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_fetch)
NOTE: Running task 2057 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_write_config)
NOTE: Running task 2073 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2094 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_fetch)
NOTE: Running task 2126 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2144 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_write_config)
NOTE: Running task 2157 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_write_config)
NOTE: Running task 2165 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: Running task 2166 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 2167 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: Running task 2168 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2169 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2170 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 2171 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: Running task 2173 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2175 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 2176 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2177 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2178 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2179 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_unpack)
NOTE: Running task 2180 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_unpack)
NOTE: Running task 2181 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_unpack)
NOTE: Running task 2182 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2183 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2184 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: Running task 2185 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2186 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2187 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_unpack)
NOTE: Running task 2188 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2190 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: Running task 2191 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: Running task 2192 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: Running task 2193 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: Running task 2194 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: Running task 2196 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2197 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: Running task 2198 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe taglib-1.12-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: Running task 2199 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Succeeded
NOTE: Running task 2200 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_patch)
NOTE: Running task 2201 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2202 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2203 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2204 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: Running task 2205 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2206 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Started
NOTE: Running task 2207 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: Running task 2209 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: Running task 2210 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2211 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2212 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.12-r0: task do_patch: Succeeded
NOTE: Running task 2213 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_generate_toolchain_file)
NOTE: Running task 2214 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2215 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_patch)
NOTE: Running task 2216 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2217 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: Running task 2218 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Started
NOTE: Running task 2220 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2221 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2222 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2223 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2224 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2225 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Succeeded
NOTE: Running task 2226 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2227 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2228 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2229 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic)
NOTE: Running task 2230 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 2231 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe taglib-1.12-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2232 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2233 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2234 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2235 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2236 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic unihash changed to b322f85745784271a0f97d98031844881dd89153a96033041c00c9206b7bb400
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2248 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 24e7bbdb90fcd4b475610092eb7faada85d7d9355d2cd4f7125251b99c42e3bd
NOTE: Setscene tasks completed
NOTE: Running task 2270 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: Running task 2278 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f21dc99d20ac7d87594cf6f890075c0c2a720b47039a37779f6a3cf7d22d0088
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2287 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe taglib-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_compile)
NOTE: recipe taglib-1.12-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2290 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 2292 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 2293 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2294 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2295 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2296 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install)
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 2297 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe taglib-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_install)
NOTE: recipe taglib-1.12-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 2299 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_populate_sysroot)
NOTE: Running task 2300 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_package)
NOTE: Running task 2301 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install_ptest_base)
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2302 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_package)
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Started
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe taglib-1.12-r0: task do_package: Succeeded
NOTE: Running task 2304 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_packagedata: Started
NOTE: recipe taglib-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 2306 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 2307 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: Running task 2314 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2318 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2321 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2322 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 2325 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2327 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: Running task 2329 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2335 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2336 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2337 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2344 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2345 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: Running task 2347 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: Running task 2353 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 2357 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2363 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2364 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 2366 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2367 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2368 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Succeeded
NOTE: Running task 2370 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_compile)
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_install)
NOTE: recipe pulseaudio-16.0-r0: task do_install: Started
NOTE: recipe pulseaudio-16.0-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_package)
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2374 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_configure)
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Succeeded
NOTE: Running task 2376 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_packagedata)
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_compile)
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Started
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_install)
NOTE: recipe mpg123-1.29.3-r0: task do_install: Started
NOTE: recipe mpg123-1.29.3-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_package)
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Started
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_packagedata)
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package)
NOTE: Running task 2387 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2390 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2391 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2391 tasks of which 2188 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 104 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoscale went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGSIZE changed from 210764 to 214860 (+2%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 15848044 to 15851892 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 11406378 to 11410593 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.2.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.3.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch"

--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47e13c9d990eca0f16664da9e59ffe05d5a170fc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47e13c9d990eca0f16664da9e59ffe05d5a170fc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 14 Mirrors 0 Missed 73 Current 611 (16% match, 89% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 622 of 698 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 698 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1284 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.20.2-r0/temp/log.do_packagedata_setscene.1812791
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 697 of 698 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_package_setscene)
NOTE: Running task 1866 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1872 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1873 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1875 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1935 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1936 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1938 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1940 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 2005 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_fetch)
NOTE: Running task 2034 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_fetch)
NOTE: Running task 2061 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2062 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2063 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_fetch)
NOTE: Running task 2070 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_fetch)
NOTE: Running task 2075 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_write_config)
NOTE: Running task 2091 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2112 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_fetch)
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 2144 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_write_config)
NOTE: Running task 2175 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_write_config)
NOTE: Running task 2183 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 2184 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 2185 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: Running task 2186 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2187 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2188 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2189 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Started
NOTE: recipe taglib-1.12-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Started
NOTE: Running task 2190 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2191 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 2192 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2193 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2194 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2195 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2196 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Started
NOTE: Running task 2197 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_unpack)
NOTE: Running task 2198 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 2199 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_unpack)
NOTE: Running task 2200 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: Running task 2201 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2202 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2203 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_unpack)
NOTE: Running task 2204 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2205 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2206 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2207 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Succeeded
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 2208 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_unpack)
NOTE: Running task 2209 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2210 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Started
NOTE: Running task 2211 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: Running task 2212 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2213 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: Running task 2214 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 2215 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2216 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: Running task 2217 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: Running task 2218 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: Running task 2219 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_patch)
NOTE: recipe taglib-1.12-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2220 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2221 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2222 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: Running task 2223 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_patch)
NOTE: Running task 2224 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 2225 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: Running task 2226 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: Running task 2227 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2228 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2229 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2230 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_generate_toolchain_file)
NOTE: Running task 2231 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2232 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2233 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: Running task 2234 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2235 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 2236 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2237 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2238 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 2239 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2240 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2241 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2242 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: Running task 2243 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2245 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 2246 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_configure)
NOTE: Running task 2247 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2248 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic)
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: Running task 2249 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2250 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2251 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe taglib-1.12-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2252 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2253 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure)
NOTE: Running task 2254 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic unihash changed to b322f85745784271a0f97d98031844881dd89153a96033041c00c9206b7bb400
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ceacde96a943d5e36c69eaeecad218c8f6bf77ab868ef4c4f4c40b6376bbdffe
NOTE: Running task 2276 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 2293 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2295 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2296 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68885898fa42694decaaa93fb8f5351a974266272251ec3d900503cb2ba7f9b5
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2305 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe taglib-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_compile)
NOTE: recipe taglib-1.12-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2308 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2312 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2314 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install)
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Started
NOTE: recipe taglib-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 2316 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_install: Succeeded
NOTE: Running task 2317 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_package)
NOTE: Running task 2319 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install_ptest_base)
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2320 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_package)
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Started
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 2321 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe taglib-1.12-r0: task do_package: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: Running task 2322 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_packagedata: Started
NOTE: recipe taglib-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 2323 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2327 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2328 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: Running task 2329 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2332 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2339 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2340 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2341 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: Running task 2343 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 2346 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: Running task 2349 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2351 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2352 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2354 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2355 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2356 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2357 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2362 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2363 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: Running task 2373 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 2375 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 2384 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2385 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2386 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_compile)
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_install)
NOTE: recipe pulseaudio-16.0-r0: task do_install: Started
NOTE: recipe pulseaudio-16.0-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_package)
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_configure)
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Succeeded
NOTE: Running task 2394 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_packagedata)
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_compile)
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Started
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_install)
NOTE: recipe mpg123-1.29.3-r0: task do_install: Started
NOTE: recipe mpg123-1.29.3-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_populate_sysroot)
NOTE: Running task 2398 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_package)
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Started
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_packagedata)
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package)
NOTE: Running task 2405 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2408 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2409 of 2409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2409 tasks of which 2206 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 104 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoscale went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-32 sysroot...done.
Removing 114 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47e13c9d990eca0f16664da9e59ffe05d5a170fc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47e13c9d990eca0f16664da9e59ffe05d5a170fc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 457 Local 388 Mirrors 0 Missed 69 Current 218 (84% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 219 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 957 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_fetch)
NOTE: Running task 962 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 963 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 964 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_fetch)
NOTE: Running task 971 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_fetch)
NOTE: Running task 974 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 975 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_fetch)
NOTE: Running task 988 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 990 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_write_config)
NOTE: Running task 992 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_write_config)
NOTE: Running task 994 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-1.12-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Started
NOTE: recipe taglib-1.12-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Started
NOTE: Running task 995 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_unpack)
NOTE: Running task 996 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 997 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: Running task 998 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_unpack)
NOTE: Running task 1000 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 1001 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running task 1002 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe taglib-1.12-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 273 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: Running task 1007 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1008 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1009 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1010 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1011 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1012 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1013 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1014 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_fetch)
NOTE: Running task 1015 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_write_config)
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-1.12-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1017 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1019 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 1020 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 1024 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: Running task 1025 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Started
NOTE: Running task 1027 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: recipe taglib-1.12-r0: task do_patch: Started
NOTE: Running task 1028 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_patch)
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Running task 1029 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1030 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1031 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_patch)
NOTE: Running task 1032 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: Running task 1033 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 1034 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe bluez5-5.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-1.12-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1051 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Started
NOTE: Running task 1052 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 1057 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_generate_toolchain_file)
NOTE: Running task 1058 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1059 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running task 1060 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 1061 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Succeeded
NOTE: Running task 1063 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_patch)
NOTE: Running task 1064 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 1065 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1066 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 331 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1067 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata_setscene)
NOTE: Running task 1068 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-base/1.20.2-r0/temp/log.do_packagedata_setscene.2550573
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 336 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_package_setscene)
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: Running setscene task 342 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 343 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: Running setscene task 356 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 1091 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1095 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 1096 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1097 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_patch)
NOTE: Running task 1098 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: Running task 1100 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1103 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1104 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1105 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Started
NOTE: Running task 1106 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1111 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1122 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1123 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic unihash changed to b322f85745784271a0f97d98031844881dd89153a96033041c00c9206b7bb400
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1138 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1146 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1148 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1154 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1155 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 378 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1161 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 466 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 478 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1315 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6728b82399c51746d3fb26f9f0cd45942f82befd320f14c8b0368e7fe1dc57bf
NOTE: Running setscene task 546 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 569 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 574 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 583 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1775 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2052 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2056 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2057 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2070 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2151 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2152 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2174 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2175 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2197 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2199 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: Running task 2201 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 07bf514b3f1bd17f4841ab5973582a4697aba46a8bb59e17af48de92273ac843
NOTE: Running task 2220 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2223 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2224 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe taglib-1.12-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2226 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2227 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2228 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_compile)
NOTE: recipe taglib-1.12-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2230 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2231 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 2234 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2235 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2237 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install)
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe taglib-1.12-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_package)
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2243 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_package)
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Started
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe taglib-1.12-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_packagedata: Started
NOTE: recipe taglib-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2246 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2247 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2248 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 2250 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Started
NOTE: Running task 2251 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2252 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2253 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2254 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2255 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2256 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2257 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2258 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2259 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2260 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2261 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 2262 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2264 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2265 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: Running task 2266 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: Running task 2268 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2269 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2273 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: Running task 2274 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2275 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2276 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 2277 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2279 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2280 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: Running task 2281 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2282 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2283 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2284 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: Running task 2285 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2287 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: Running task 2290 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2291 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 2292 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 2293 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2294 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 2297 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2300 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2303 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2304 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2305 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_compile)
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Succeeded
NOTE: Running task 2307 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_install)
NOTE: recipe pulseaudio-16.0-r0: task do_install: Started
NOTE: recipe pulseaudio-16.0-r0: task do_install: Succeeded
NOTE: Running task 2308 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_populate_sysroot)
NOTE: Running task 2309 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_package)
NOTE: recipe pulseaudio-16.0-r0: task do_package: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2310 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2311 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_configure)
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Succeeded
NOTE: Running task 2312 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_packagedata)
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_compile)
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Started
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_install)
NOTE: recipe mpg123-1.29.3-r0: task do_install: Started
NOTE: recipe mpg123-1.29.3-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_package)
NOTE: recipe mpg123-1.29.3-r0: task do_package: Started
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2317 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2318 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Succeeded
NOTE: Running task 2319 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_packagedata)
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2321 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package)
NOTE: Running task 2323 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2326 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2327 of 2327 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2327 tasks of which 2129 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 104 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoscale went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47e13c9d990eca0f16664da9e59ffe05d5a170fc"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47e13c9d990eca0f16664da9e59ffe05d5a170fc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 12 Mirrors 0 Missed 73 Current 599 (14% match, 89% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 608 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1273 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1848 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1854 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1855 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1857 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1906 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1907 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1908 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1909 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1972 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_fetch)
NOTE: Running task 1998 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-base/1.20.2-r0/temp/log.do_packagedata_setscene.2180565
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 683 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_package_setscene)
NOTE: Running task 2024 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2025 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_fetch)
NOTE: Running task 2026 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2032 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_fetch)
NOTE: Running task 2034 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_write_config)
NOTE: Running task 2047 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2068 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_fetch)
NOTE: Running task 2092 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 2108 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_write_config)
NOTE: Running task 2121 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_write_config)
NOTE: Running task 2129 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: Running task 2130 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2131 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2132 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2133 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.12-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Started
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 2134 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_unpack)
NOTE: Running task 2135 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2136 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: Running task 2137 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 2138 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: Running task 2139 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2140 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Started
NOTE: Running task 2141 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2142 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Started
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Succeeded
NOTE: Running task 2143 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2144 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: Running task 2145 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2146 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_unpack)
NOTE: Running task 2147 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2148 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_unpack)
NOTE: Running task 2149 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2150 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_unpack)
NOTE: Running task 2151 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_unpack)
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2152 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2153 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: Running task 2154 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2155 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: Running task 2156 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2157 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2158 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_patch)
NOTE: Running task 2159 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: Running task 2160 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe taglib-1.12-r0: task do_patch: Started
NOTE: Running task 2161 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2162 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2163 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 2164 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_patch)
NOTE: Running task 2165 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_patch)
NOTE: Running task 2166 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2167 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2168 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.12-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 2169 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2170 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2171 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_generate_toolchain_file)
NOTE: Running task 2173 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2175 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_patch)
NOTE: Running task 2176 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2179 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2180 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_patch)
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: Running task 2181 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: Running task 2182 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: Running task 2183 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2185 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2186 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2187 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2188 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2189 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 2190 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2191 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_configure)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2193 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic)
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2194 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: Running task 2195 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2196 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2197 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2198 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2199 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2200 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic unihash changed to b322f85745784271a0f97d98031844881dd89153a96033041c00c9206b7bb400
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5a87bce771979224b08661aca9e0f2c5a3c9278fb6b3f8becbeb8c95beab0433
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2222 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 2239 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2240 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2241 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2242 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fc785bd9401961ddf48c66e20cc7d64b01053c2960c2558eeebb4f01a6ac1297
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2251 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2252 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_compile)
NOTE: recipe taglib-1.12-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2253 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2254 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 2256 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 2257 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2258 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2259 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2260 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install)
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: Running task 2261 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_install)
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install_ptest_base)
NOTE: recipe taglib-1.12-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2264 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_package)
NOTE: recipe taglib-1.12-r0: task do_install: Succeeded
NOTE: Running task 2265 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_populate_sysroot)
NOTE: Running task 2266 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_package)
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Started
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_package: Started
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 2267 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe taglib-1.12-r0: task do_package: Succeeded
NOTE: Running task 2268 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: recipe taglib-1.12-r0: task do_packagedata: Started
NOTE: Running task 2269 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe taglib-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2272 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: Running task 2273 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2274 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2275 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2276 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: Running task 2277 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2279 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2280 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2281 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2282 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: Running task 2285 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2286 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2287 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: Running task 2288 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2290 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: Running task 2291 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 2292 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 2294 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2296 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2297 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2298 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 2304 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2305 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2308 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2309 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2310 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 2311 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: Running task 2315 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2319 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 2321 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2325 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2327 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2329 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 2330 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2331 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_compile)
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_install)
NOTE: recipe pulseaudio-16.0-r0: task do_install: Started
NOTE: recipe pulseaudio-16.0-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_populate_sysroot)
NOTE: Running task 2337 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_package)
NOTE: recipe pulseaudio-16.0-r0: task do_package: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2338 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_configure)
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_packagedata)
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_compile)
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Started
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_install)
NOTE: recipe mpg123-1.29.3-r0: task do_install: Started
NOTE: recipe mpg123-1.29.3-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_populate_sysroot)
NOTE: Running task 2344 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_package)
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Started
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2345 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_packagedata)
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package)
NOTE: Running task 2351 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2353 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2354 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2355 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2355 tasks of which 2152 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 104 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoscale went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1201863840076941612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-47e13c9d990eca0f16664da9e59ffe05d5a170fc"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:47e13c9d990eca0f16664da9e59ffe05d5a170fc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 14 Mirrors 0 Missed 73 Current 607 (16% match, 89% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 618 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1284 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.20.2-r0/temp/log.do_packagedata_setscene.1989112
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 693 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_package_setscene)
NOTE: Running task 1860 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: Running task 1866 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_fetch)
NOTE: Running task 1867 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1869 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1917 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_fetch)
NOTE: Running task 1918 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_fetch)
NOTE: Running task 1920 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1922 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1987 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_fetch)
NOTE: Running task 2016 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_fetch)
NOTE: Running task 2043 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2045 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_fetch)
NOTE: Running task 2046 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_fetch)
NOTE: Running task 2052 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_fetch)
NOTE: Running task 2057 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_write_config)
NOTE: Running task 2073 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 2094 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_fetch)
NOTE: Running task 2126 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: recipe ell-0.51-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Started
NOTE: Running task 2144 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_write_config)
NOTE: Running task 2157 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_write_config)
NOTE: Running task 2165 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.51-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Started
NOTE: Running task 2166 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: Running task 2167 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2168 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_unpack)
NOTE: Running task 2169 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2170 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-1.34-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_fetch: Succeeded
NOTE: Running task 2171 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_unpack)
NOTE: Running task 2172 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe taglib-1.12-r0: task do_fetch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Started
NOTE: Running task 2173 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_unpack)
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Started
NOTE: recipe speex-1.2.0-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe taglib-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 2175 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Started
NOTE: recipe mpg123-1.29.3-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2176 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2177 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Started
NOTE: Running task 2178 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_unpack)
NOTE: Running task 2179 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_unpack)
NOTE: Running task 2180 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2181 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_unpack)
NOTE: Running task 2182 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_unpack)
NOTE: Running task 2183 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2184 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Started
NOTE: Running task 2185 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2186 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_unpack)
NOTE: Running task 2187 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2188 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2189 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2190 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_unpack)
NOTE: Running task 2191 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe pulseaudio-16.0-r0: task do_write_config: Succeeded
NOTE: recipe ofono-1.34-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2193 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Started
NOTE: Running task 2194 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_patch)
NOTE: recipe speex-1.2.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Started
NOTE: recipe ell-0.51-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Started
NOTE: recipe taglib-1.12-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe speex-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_patch)
NOTE: Running task 2196 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Started
NOTE: Running task 2197 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2198 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ofono-1.34-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_unpack: Succeeded
NOTE: Running task 2199 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_patch)
NOTE: recipe ell-0.51-r0: task do_patch: Started
NOTE: Running task 2200 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_patch)
NOTE: recipe taglib-1.12-r0: task do_patch: Started
NOTE: recipe speex-1.2.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2201 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2202 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2204 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2205 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe pulseaudio-16.0-r0: task do_unpack: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Started
NOTE: Running task 2206 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_unpack: Succeeded
NOTE: Running task 2207 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_patch: Succeeded
NOTE: Running task 2208 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2209 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Started
NOTE: recipe taglib-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 2210 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.12-r0: task do_patch: Succeeded
NOTE: Running task 2211 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2212 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_generate_toolchain_file)
NOTE: Running task 2213 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2214 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2215 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.29.3-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2216 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe ofono-1.34-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2217 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_patch)
NOTE: Running task 2218 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-networking-2.72.0-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2221 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.12-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2222 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_configure)
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2223 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2224 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.0-r0: task do_patch: Succeeded
NOTE: recipe ell-0.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2225 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 2226 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Started
NOTE: recipe taglib-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2227 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_configure)
NOTE: recipe speex-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2228 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2229 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: Running task 2230 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2231 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe mpg123-1.29.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.12-r0: task do_configure: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2232 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure)
NOTE: Running task 2233 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2234 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2235 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2236 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_lic unihash changed to b322f85745784271a0f97d98031844881dd89153a96033041c00c9206b7bb400
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2248 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2249 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 687ea4f02cf2520d1e4f6f05acf6a7c02d4c00ce54cbb04ee3ff9a790a9b0d36
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2278 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6b884e10bab8744614c446ec2af7b2429353d31ec97ee2b6763a153ee41e4951
NOTE: recipe ell-0.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2287 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_configure)
NOTE: recipe ell-0.51-r0: task do_configure: Started
NOTE: recipe taglib-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_compile)
NOTE: recipe taglib-1.12-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2290 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_compile: Succeeded
NOTE: Running task 2292 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_install: Succeeded
NOTE: Running task 2293 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2294 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_compile: Succeeded
NOTE: Running task 2295 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2296 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_package: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Started
NOTE: recipe taglib-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2297 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_install)
NOTE: Running task 2298 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20220511-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.12-r0: task do_install: Succeeded
NOTE: Running task 2299 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_populate_sysroot)
NOTE: Running task 2300 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_package)
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.12-r0: task do_package: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2302 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_package)
NOTE: recipe taglib-1.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_configure: Succeeded
NOTE: Running task 2303 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Started
NOTE: recipe taglib-1.12-r0: task do_package: Succeeded
NOTE: Running task 2304 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.12.bb:do_packagedata)
NOTE: recipe taglib-1.12-r0: task do_packagedata: Started
NOTE: recipe taglib-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_install)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_install: Succeeded
NOTE: Running task 2306 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot)
NOTE: Running task 2307 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_package)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2308 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.0-r0: task do_package: Succeeded
NOTE: Running task 2310 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb:do_packagedata)
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2312 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_package: Succeeded
NOTE: Running task 2314 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata)
NOTE: recipe glib-networking-2.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2316 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2317 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2319 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: Running task 2322 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2323 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speex-1.2.0-r0: task do_configure: Started
NOTE: recipe ell-0.51-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe ell-0.51-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe ell-0.51-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe ell-0.51-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2335 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2336 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.51-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.51-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2338 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_configure)
NOTE: recipe ofono-1.34-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.51-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.51.bb:do_packagedata)
NOTE: recipe ell-0.51-r0: task do_packagedata: Started
NOTE: recipe ell-0.51-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_package)
NOTE: Running task 2344 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2345 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2346 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_compile)
NOTE: recipe speex-1.2.0-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_compile)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_compile)
NOTE: recipe ofono-1.34-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2353 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speex-1.2.0-r0: task do_package: Started
NOTE: recipe speex-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speex-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.0.bb:do_packagedata)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_install)
NOTE: recipe speex-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-1.34-r0: task do_install: Started
NOTE: recipe ofono-1.34-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_populate_sysroot)
NOTE: Running task 2357 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_package)
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.34-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_install)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Started
NOTE: recipe ofono-1.34-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.34.bb:do_packagedata)
NOTE: recipe ofono-1.34-r0: task do_packagedata: Started
NOTE: recipe ofono-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_packagedata)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2363 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_package_write_rpm)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 2364 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 2366 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2367 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2368 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_configure)
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 2369 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe pulseaudio-16.0-r0: task do_configure: Succeeded
NOTE: Running task 2370 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_compile)
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-16.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_install)
NOTE: recipe pulseaudio-16.0-r0: task do_install: Started
NOTE: recipe pulseaudio-16.0-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_package)
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Started
NOTE: recipe pulseaudio-16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2374 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_configure)
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.0-r0: task do_package: Succeeded
NOTE: Running task 2376 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.0.bb:do_packagedata)
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-16.0-r0: task do_packagedata: Succeeded
NOTE: recipe mpg123-1.29.3-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_compile)
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Started
NOTE: recipe mpg123-1.29.3-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_install)
NOTE: recipe mpg123-1.29.3-r0: task do_install: Started
NOTE: recipe mpg123-1.29.3-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_package)
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Started
NOTE: recipe mpg123-1.29.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.29.3-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb:do_packagedata)
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.29.3-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package)
NOTE: Running task 2387 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2390 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2391 of 2391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2391 tasks of which 2188 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 104 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoscale went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1201863840076941612==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.20.2-1.20.3.patch"

From 4d285ce187b9cee6a98e55f5945cb0bb708fbfc8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 12:25:45 +0000
Subject: [PATCH] gstreamer1.0-plugins-good: upgrade 1.20.2 -> 1.20.3

---
 ...ugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
index 6c52fb35b9..0235935a4a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "83589007bf002b8f9ef627718f308c16d83351905f0db8e85c3060f304143aae"
+SRC_URI[sha256sum] = "f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.31.1


--===============1201863840076941612==--

