Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A74AC38A06
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.10486.1647349734701737647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ccDc+1Ee;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db22032-4b06e92d-7044-4972-a081-fee5324f3020-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JlvH+uH1H6LkqrXq5mFpH3Ze2utttdk1RUvenl+W9Go=;
	b=ccDc+1EeW2AgI6yeonFWh0ffojk4Rr2jHy4hj197Qaao6Ea6J5vLjxFny8BDzkeN
	vOQBz1X1jV8ShbXwksPejNeZJ9+vcFWkgfVk+A+8S/QtTYObZhLfxSXBs7OUxGIyeyx
	XBvEU9IqJxoEcdXA2M754l3WTBHT0jORBPpqX0+g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JlvH+uH1H6LkqrXq5mFpH3Ze2utttdk1RUvenl+W9Go=;
	b=kQxfYAyr9dowyYa1+NsqFc1zWGZkbgU+j2xYKQANddcOYeWuASWbTg5ddWK79o7F
	WihAdxXegwo8s3J6Nhnc0mSixpRmPG2J35tFBmEwyuiF6MmGWJ1FNqW/Lk5mqzkvVYD
	PpxZVso/wLqcD4+dUsy7OdpPB/0/tsaMtSWIOEow=
Content-Type: multipart/mixed; boundary="===============1596464922301356542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.20.1 SUCCEEDED
Message-ID: 
 <0101017f8db22032-4b06e92d-7044-4972-a081-fee5324f3020-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:55 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163275

--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.20.0-1.20.1.patch
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
--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.1.tar.xz"

--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-388586b4a22b2a15cebb6513243ad863f519e712"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:388586b4a22b2a15cebb6513243ad863f519e712"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 6 Mirrors 0 Missed 67 Current 623 (8% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1816 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1837 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_fetch)
NOTE: Running task 1846 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_fetch)
NOTE: Running task 1847 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_fetch)
NOTE: Running task 1952 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1965 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_fetch)
NOTE: Running task 1990 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_fetch)
NOTE: Running task 2002 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_fetch)
NOTE: Running task 2024 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 2051 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2052 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2054 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2060 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2099 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Started
NOTE: Running task 2133 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_fetch)
NOTE: Running task 2137 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Started
NOTE: Running task 2167 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2181 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Succeeded
NOTE: Running task 2183 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_unpack)
NOTE: Running task 2184 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2185 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_unpack)
NOTE: recipe bluez5-5.63-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Started
NOTE: Running task 2186 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2187 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 2188 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_unpack)
NOTE: Running task 2189 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2190 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_unpack)
NOTE: Running task 2191 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2192 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2193 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2194 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 2195 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_unpack)
NOTE: Running task 2196 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: Running task 2197 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe vala-0.54.7-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 2198 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2199 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2200 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 2201 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_unpack)
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Started
NOTE: recipe bluez5-5.63-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: Running task 2202 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: Running task 2204 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2205 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Succeeded
NOTE: Running task 2207 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 2208 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2209 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_patch)
NOTE: Running task 2210 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2211 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_patch)
NOTE: Running task 2212 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bluez5-5.63-r0: task do_unpack: Succeeded
NOTE: Running task 2213 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2214 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2215 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2217 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2218 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2219 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2220 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2221 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2222 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2223 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_patch: Started
NOTE: Running task 2224 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2225 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.54.7-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2226 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2227 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2228 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.63-r0: task do_patch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_patch: Succeeded
NOTE: Running task 2229 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_deploy_source_date_epoch)
NOTE: Running task 2230 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic unihash changed to 4b56432be17f93f594af3b448d2f845dbd58370bd1dd61abd45757f972525b2b
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2231 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2232 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2233 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2234 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_configure)
NOTE: Running task 2235 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2236 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2237 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2238 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2240 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2293 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2310 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Started
NOTE: Running task 2315 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2317 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2320 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d25d3c26c678c93d22c45641c2dcd551821a8aa1afdac7a764ed3ac034eb65e6
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Succeeded
NOTE: Running task 2346 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2347 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2348 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2349 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe vala-0.54.7-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Succeeded
NOTE: Running task 2350 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_rust_create_wrappers)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2353 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2354 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2359 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2361 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2362 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2363 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: Running task 2364 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2368 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile)
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2370 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install)
NOTE: recipe libusb1-1.0.25-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2373 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_package)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2376 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_packagedata)
NOTE: Running task 2380 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_compile)
NOTE: recipe vala-0.54.7-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_compile)
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: Running task 2384 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe vala-0.54.7-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2390 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2391 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_compile: Succeeded
NOTE: Running task 2393 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_install)
NOTE: recipe vala-0.54.7-r0: task do_install: Started
NOTE: recipe vala-0.54.7-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_package)
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Started
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2397 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_install)
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_package)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata)
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2403 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Succeeded
NOTE: Running task 2405 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2407 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2408 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2410 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2412 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure)
NOTE: recipe bluez5-5.63-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_configure: Succeeded
NOTE: Running task 2418 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2419 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile)
NOTE: recipe bluez5-5.63-r0: task do_compile: Started
NOTE: recipe bluez5-5.63-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_populate_sysroot)
NOTE: Running task 2423 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_package)
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata)
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Failed
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2424 tasks of which 2259 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/librsvg/2.52.6-r0/temp/log.do_packagedata.167823
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata) failed with exit code '1'

--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-388586b4a22b2a15cebb6513243ad863f519e712"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:388586b4a22b2a15cebb6513243ad863f519e712"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 6 Mirrors 0 Missed 67 Current 609 (8% match, 90% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1798 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1819 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_fetch)
NOTE: Running task 1828 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_fetch)
NOTE: Running task 1829 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_fetch)
NOTE: Running task 1919 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1932 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_fetch)
NOTE: Running task 1954 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_fetch)
NOTE: Running task 1966 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_fetch)
NOTE: Running task 1986 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 2007 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2008 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2010 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2016 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2047 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 2081 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_fetch)
NOTE: Running task 2083 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2113 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2127 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_fetch: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Succeeded
NOTE: Running task 2129 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2130 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Started
NOTE: Running task 2131 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.63-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Succeeded
NOTE: Running task 2132 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_unpack)
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2133 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2134 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_unpack)
NOTE: Running task 2135 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2136 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_unpack)
NOTE: Running task 2137 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2138 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2139 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2140 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2141 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Started
NOTE: Running task 2142 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 2143 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_unpack)
NOTE: Running task 2144 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2145 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 2146 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_unpack)
NOTE: Running task 2147 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: recipe vala-0.54.7-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.63-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Started
NOTE: Running task 2148 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Succeeded
NOTE: Running task 2149 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_patch)
NOTE: Running task 2151 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2152 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 2154 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_patch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 2156 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_patch)
NOTE: Running task 2157 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_unpack: Succeeded
NOTE: Running task 2158 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: Running task 2159 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2160 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Succeeded
NOTE: Running task 2161 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 2162 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2163 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2164 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2165 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic)
NOTE: recipe vala-0.54.7-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2167 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2168 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_patch)
NOTE: Running task 2169 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.63-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 2171 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2172 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2173 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.54.7-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.54.7-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2175 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.63-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2176 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2177 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic unihash changed to 4b56432be17f93f594af3b448d2f845dbd58370bd1dd61abd45757f972525b2b
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2178 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2179 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2180 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2181 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2182 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2183 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2184 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2185 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2186 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2187 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_install)
NOTE: Running task 2240 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2241 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2257 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2262 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2264 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2265 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2266 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3d10e13db30fbd57f74e3cdf7abcd55c19a02df807945b0d76c501e33b62027f
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2291 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_patch)
NOTE: Running task 2292 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2293 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Succeeded
NOTE: Running task 2296 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2298 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2299 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_packagedata)
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2303 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2304 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2305 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_install)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_package)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: Running task 2310 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure_ptest_base)
NOTE: Running task 2313 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_packagedata)
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2314 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile)
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2316 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.25-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2319 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_package)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_package: Started
NOTE: Running task 2321 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2323 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2324 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Succeeded
NOTE: Running task 2325 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_compile)
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe vala-0.54.7-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2331 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe vala-0.54.7-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2332 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2335 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2336 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Succeeded
NOTE: Running task 2339 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_compile)
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Started
NOTE: recipe vala-0.54.7-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_install)
NOTE: recipe vala-0.54.7-r0: task do_install: Started
NOTE: recipe vala-0.54.7-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_package)
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2343 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_install)
NOTE: recipe vala-0.54.7-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_populate_sysroot)
NOTE: Running task 2345 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_package)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Started
NOTE: Running task 2346 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2347 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2348 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2349 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Succeeded
NOTE: Running task 2350 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_package: Succeeded
NOTE: Running task 2351 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata)
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2355 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2357 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2360 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2361 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure)
NOTE: recipe bluez5-5.63-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_configure: Succeeded
NOTE: Running task 2364 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2365 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile)
NOTE: recipe bluez5-5.63-r0: task do_compile: Started
NOTE: recipe bluez5-5.63-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_package)
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata)
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Failed
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2370 tasks of which 2205 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/librsvg/2.52.6-r0/temp/log.do_packagedata.335029
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata) failed with exit code '1'

--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-388586b4a22b2a15cebb6513243ad863f519e712"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:388586b4a22b2a15cebb6513243ad863f519e712"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 6 Mirrors 0 Missed 67 Current 619 (8% match, 90% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1810 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1831 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_fetch)
NOTE: Running task 1840 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_fetch)
NOTE: Running task 1841 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_fetch)
NOTE: Running task 1934 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1947 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_fetch)
NOTE: Running task 1972 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_fetch)
NOTE: Running task 1984 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_fetch)
NOTE: Running task 2006 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 2033 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2034 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2036 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2042 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2081 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: Running task 2115 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_fetch)
NOTE: Running task 2119 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe vala-0.54.7-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Started
NOTE: Running task 2149 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2163 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Succeeded
NOTE: Running task 2165 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2166 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_unpack)
NOTE: recipe bluez5-5.63-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Started
NOTE: Running task 2167 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Started
NOTE: Running task 2168 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2169 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: Running task 2170 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_unpack)
NOTE: Running task 2171 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2173 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2174 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_unpack)
NOTE: Running task 2175 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2176 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2177 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 2178 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 2179 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2180 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: recipe vala-0.54.7-r0: task do_unpack: Started
NOTE: Running task 2181 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 2182 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Started
NOTE: Running task 2183 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2184 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2187 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2188 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2189 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Succeeded
NOTE: Running task 2190 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_patch)
NOTE: Running task 2192 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Started
NOTE: Running task 2193 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 2194 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe bluez5-5.63-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Started
NOTE: Running task 2195 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: Running task 2196 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2197 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2198 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2199 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2200 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2201 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2203 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic)
NOTE: Running task 2204 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2205 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.54.7-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_patch: Started
NOTE: Running task 2206 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_patch)
NOTE: Running task 2207 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2208 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2209 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2210 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.54.7-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2211 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.63-r0: task do_patch: Succeeded
NOTE: Running task 2212 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic unihash changed to 4b56432be17f93f594af3b448d2f845dbd58370bd1dd61abd45757f972525b2b
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2213 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2214 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2215 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_configure)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2216 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2217 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Running task 2218 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2219 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2220 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2221 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: Running task 2222 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_install)
NOTE: Running task 2275 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2276 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2292 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2297 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Started
NOTE: Running task 2299 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2301 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_package)
NOTE: Running task 2302 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ef4803d6d46aaa652317dde5016660c3c9bfb4f26fb5b82a00119f969712810f
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2329 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe vala-0.54.7-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_rust_create_wrappers)
NOTE: Running task 2334 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2335 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2341 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2344 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2346 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 2348 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2350 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile)
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2352 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install)
NOTE: recipe libusb1-1.0.25-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_package)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2359 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Started
NOTE: Running task 2362 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_packagedata)
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe vala-0.54.7-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2366 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_install)
NOTE: recipe vala-0.54.7-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_compile)
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Started
NOTE: recipe vala-0.54.7-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_package)
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Started
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_install)
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2381 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_package)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2384 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata)
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure)
NOTE: recipe bluez5-5.63-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2401 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile)
NOTE: recipe bluez5-5.63-r0: task do_compile: Started
NOTE: recipe bluez5-5.63-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_package)
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2406 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata)
NOTE: recipe bluez5-5.63-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Failed
NOTE: recipe bluez5-5.63-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 2407 tasks of which 2241 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/librsvg/2.52.6-r0/temp/log.do_packagedata.419363
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata) failed with exit code '1'

--===============1596464922301356542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.20.0-1.20.1.patch"

From c771a45484c3ac07a7d8858fb252285fd67c0f7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 11:26:11 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.20.0 -> 1.20.1

---
 .../{gstreamer1.0-omx_1.20.0.bb => gstreamer1.0-omx_1.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.0.bb => gstreamer1.0-omx_1.20.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
index 94c5214a37..835f9a31fd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c1e46b70ac379ac7b3646506370c9e1007b56ae293f4d334bc0e724c76c345dd"
+SRC_URI[sha256sum] = "86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.27.0


--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-388586b4a22b2a15cebb6513243ad863f519e712"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:388586b4a22b2a15cebb6513243ad863f519e712"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 6 Mirrors 0 Missed 67 Current 619 (8% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1810 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1831 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_fetch)
NOTE: Running task 1840 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_fetch)
NOTE: Running task 1841 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_fetch)
NOTE: Running task 1934 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1947 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_fetch)
NOTE: Running task 1972 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_fetch)
NOTE: Running task 1984 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_fetch)
NOTE: Running task 2006 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 2033 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2034 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2036 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2042 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2081 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 2115 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_fetch)
NOTE: Running task 2117 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2149 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2163 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_fetch: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: Running task 2165 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2166 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Started
NOTE: Running task 2167 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2168 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 2169 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2170 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_unpack)
NOTE: recipe bluez5-5.63-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2171 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2172 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: Running task 2173 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_unpack)
NOTE: Running task 2174 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2175 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2176 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2177 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 2178 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 2179 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2180 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Succeeded
NOTE: Running task 2181 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_unpack)
NOTE: Running task 2182 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 2183 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe vala-0.54.7-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe bluez5-5.63-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2184 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_patch)
NOTE: Running task 2186 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2187 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2188 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2189 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2190 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: Running task 2192 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2193 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: Running task 2194 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bluez5-5.63-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2195 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_patch)
NOTE: Running task 2196 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2197 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2198 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Succeeded
NOTE: Running task 2199 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2200 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2201 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2202 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2203 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Succeeded
NOTE: Running task 2204 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2205 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_patch: Started
NOTE: Running task 2206 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 2207 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2208 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2209 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic)
NOTE: recipe bluez5-5.63-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2210 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.54.7-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2211 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2212 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 2213 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2214 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bluez5-5.63-r0: task do_patch: Succeeded
NOTE: Running task 2215 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: Running task 2216 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2217 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2218 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic unihash changed to 4b56432be17f93f594af3b448d2f845dbd58370bd1dd61abd45757f972525b2b
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: Running task 2219 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2220 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2221 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2275 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2291 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2296 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2298 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2299 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Started
NOTE: Running task 2300 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2301 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2302 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9b074ab49bf314dbb0b484132f7ef5d7b9a473bb3d8de5b302c51a07269ab907
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe vala-0.54.7-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2331 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2334 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2335 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2341 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_install)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2343 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2344 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_package)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure_ptest_base)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2350 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile)
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2352 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install)
NOTE: recipe libusb1-1.0.25-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2354 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2359 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_compile)
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Started
NOTE: recipe vala-0.54.7-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: Running task 2363 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_packagedata)
NOTE: recipe vala-0.54.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2366 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2367 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_install)
NOTE: recipe vala-0.54.7-r0: task do_install: Started
NOTE: recipe vala-0.54.7-r0: task do_install: Succeeded
NOTE: Running task 2376 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot)
NOTE: Running task 2377 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_package)
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_compile)
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Started
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Succeeded
NOTE: Running task 2381 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_install)
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_package)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Succeeded
NOTE: Running task 2384 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2385 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2386 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2388 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure)
NOTE: recipe bluez5-5.63-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2401 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile)
NOTE: recipe bluez5-5.63-r0: task do_compile: Started
NOTE: recipe bluez5-5.63-r0: task do_compile: Succeeded
NOTE: Running task 2402 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_package)
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata)
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Failed
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2406 tasks of which 2241 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/librsvg/2.52.6-r0/temp/log.do_packagedata.251348
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata) failed with exit code '1'

--===============1596464922301356542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-388586b4a22b2a15cebb6513243ad863f519e712"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:388586b4a22b2a15cebb6513243ad863f519e712"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 453 Local 380 Mirrors 0 Missed 73 Current 230 (83% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 231 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 902 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 916 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_fetch)
NOTE: Running task 925 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_fetch)
NOTE: Running task 926 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_fetch)
NOTE: Running task 975 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 983 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_fetch)
NOTE: Running task 994 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_fetch)
NOTE: Running task 997 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_fetch)
NOTE: Running task 1004 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_fetch)
NOTE: Running task 1005 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1006 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1007 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1011 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 1030 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 1039 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_fetch)
NOTE: Running task 1040 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1062 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 1065 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_fetch: Started
NOTE: recipe vala-0.54.7-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Started
NOTE: Running task 1066 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1067 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Started
NOTE: recipe bluez5-5.63-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running task 1068 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Started
NOTE: Running task 1069 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_unpack)
NOTE: Running task 1070 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_unpack)
NOTE: recipe libsndfile1-1.0.31-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: Running task 1071 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 1072 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_fetch)
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1073 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_unpack)
NOTE: Running task 1074 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 1075 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe librsvg-2.52.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_unpack)
NOTE: Running task 1081 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1082 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: Running setscene task 323 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1083 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 328 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1088 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1091 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 1095 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_unpack)
NOTE: recipe bluez5-5.63-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.10-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Started
NOTE: Running task 1100 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1101 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: Running task 1102 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 1103 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_unpack: Succeeded
NOTE: Running task 1104 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1105 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libstd-rs-1.59.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1106 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running setscene task 335 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.59.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1111 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1112 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_patch)
NOTE: Running task 1113 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_patch)
NOTE: Running setscene task 338 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: Running task 1114 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_patch)
NOTE: recipe libsndfile1-1.0.31-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 1116 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1118 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_patch)
NOTE: recipe rust-cross-core2-32-musl-1.59.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Started
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe eudev-3.2.10-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1119 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_patch)
NOTE: Running task 1120 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1121 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 1122 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 1123 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1124 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1125 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic)
NOTE: Running task 1126 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe libusb1-1.0.25-r0: task do_patch: Succeeded
NOTE: Running task 1127 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_patch: Started
NOTE: Running task 1128 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 341 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1134 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 1135 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 360 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1145 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_generate_toolchain_file)
NOTE: Running task 1146 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.54.7-r0: task do_unpack: Succeeded
NOTE: recipe rust-cross-core2-32-musl-1.59.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1147 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Started
NOTE: Running setscene task 363 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1158 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_patch: Started
NOTE: Running setscene task 370 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.63-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb:do_populate_lic unihash changed to 4b56432be17f93f594af3b448d2f845dbd58370bd1dd61abd45757f972525b2b
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1164 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_deploy_source_date_epoch)
NOTE: recipe eudev-3.2.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1166 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 388 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1190 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: Running task 1191 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 396 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 408 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1242 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 422 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 459 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 475 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running task 1300 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 490 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.52.6-r0: task do_patch: Succeeded
NOTE: Running task 1326 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 527 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running task 1347 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe librsvg-2.52.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1363 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1364 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 535 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 538 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 544 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 562 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 563 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 572 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running task 1385 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 577 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 578 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 589 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1423 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1464 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1473 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1507 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1532 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f4c1a74c88f81e9917b838289399c0e2c6cacc17e2178d79e7c58c9e0b287dfd
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1822 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1990 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2090 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2116 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2146 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2171 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2172 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2224 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2244 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2249 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_configure)
NOTE: Running task 2256 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: Running task 2266 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2267 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2268 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_install)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Started
NOTE: recipe vala-0.54.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2269 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_configure)
NOTE: recipe vala-0.54.7-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2271 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_package)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2272 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2273 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.52.6-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2274 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2275 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2276 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_configure: Succeeded
NOTE: Running task 2277 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_install)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_install: Succeeded
NOTE: Running task 2279 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_sysroot)
NOTE: Running task 2280 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_package)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2281 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: Running task 2282 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_package: Succeeded
NOTE: Running task 2283 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2286 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 2287 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 2288 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2291 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2292 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe eudev-3.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2293 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_configure)
NOTE: recipe eudev-3.2.10-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 2294 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2295 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2296 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_compile)
NOTE: Running task 2297 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2298 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe vala-0.54.7-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.54.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2301 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2303 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2304 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2305 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2306 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_compile)
NOTE: recipe eudev-3.2.10-r0: task do_compile: Started
NOTE: recipe eudev-3.2.10-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_install)
NOTE: recipe eudev-3.2.10-r0: task do_install: Started
NOTE: recipe eudev-3.2.10-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_populate_sysroot)
NOTE: Running task 2312 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_package)
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.10-r0: task do_package: Started
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2313 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2314 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_configure: Succeeded
NOTE: Running task 2315 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_compile)
NOTE: recipe libusb1-1.0.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure)
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe eudev-3.2.10-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_packagedata)
NOTE: recipe eudev-3.2.10-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_install)
NOTE: recipe eudev-3.2.10-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_populate_sysroot)
NOTE: Running task 2322 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_package)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Started
NOTE: recipe vala-0.54.7-r0: task do_compile: Succeeded
NOTE: Running task 2323 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_install)
NOTE: recipe vala-0.54.7-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2324 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe vala-0.54.7-r0: task do_install: Succeeded
NOTE: Running task 2326 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_package)
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.54.7-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2328 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libsndfile1-1.0.31-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Started
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2330 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2331 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2332 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2334 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_package: Succeeded
NOTE: Running task 2335 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata)
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2340 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2342 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile)
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe libusb1-1.0.25-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_compile_ptest_base)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2345 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install)
NOTE: recipe libusb1-1.0.25-r0: task do_install: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2347 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_populate_sysroot)
NOTE: Running task 2348 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_package)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.25-r0: task do_package: Started
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.25-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_packagedata)
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2351 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2352 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2353 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.63-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2354 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure)
NOTE: recipe bluez5-5.63-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2355 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.63-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2357 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile)
NOTE: recipe bluez5-5.63-r0: task do_compile: Started
NOTE: recipe bluez5-5.63-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.52.6-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_install)
NOTE: recipe librsvg-2.52.6-r0: task do_install: Started
NOTE: recipe librsvg-2.52.6-r0: task do_install: Succeeded
NOTE: Running task 2360 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_populate_sysroot)
NOTE: Running task 2361 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_package)
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.52.6-r0: task do_package: Started
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata)
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata: Failed
NOTE: recipe bluez5-5.63-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2362 tasks of which 2171 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.52.7-r0 to 0:2.52.6-r0) [version-going-backwards]
ERROR: librsvg-2.52.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/librsvg/2.52.6-r0/temp/log.do_packagedata.530343
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata) failed with exit code '1'

--===============1596464922301356542==--

