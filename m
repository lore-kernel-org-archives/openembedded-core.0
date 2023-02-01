Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68B4C38142
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.30009.1675272855344017860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=e3bDHORN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b3754-0a93b16d-b03a-4c6a-84a9-f749e70f80a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272861;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Aw/6wQAOL8mYIFYIBb3Vo9j29PIsV9EW23vy79eH5sY=;
	b=e3bDHORN8FsSmP+ZkBc+3qPiM0HIa4uHd2x1bUPyT1tyMAKfMv1C31V7cIbmFKLU
	g/qaG9FKFjg/GnIewH2kpm0/l7nmBR9+aI23hihvY7TtEsI+uKqXceVO6dD9qrduUmC
	+hx03EusC9IMri5dkEIQIOErfTQH25pxqs3Js2YQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272861;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Aw/6wQAOL8mYIFYIBb3Vo9j29PIsV9EW23vy79eH5sY=;
	b=fs7jhkTY1pB28YvkmifjfcNWVlL+TdZQ4fCCRnMw2LPXTnjeq3utmR3Exe7RzcJ8
	S4FGk2+/rRFPcUeEqd+uYy0NSzPWH1NCqTL8mWUV0Y5JIvEyphiWqYlOuU1RoyuRfl5
	LQ/b9TGktzgyM7TcLQnoMlgGa9fY4XEPOQkZgfrY=
Content-Type: multipart/mixed; boundary="===============7856573351411553736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.31.2 SUCCEEDED
Message-ID: <010101860e0b3754-0a93b16d-b03a-4c6a-84a9-f749e70f80a9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176653

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.31.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.31.1-1.31.2.patch
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
--===============7856573351411553736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.31.1-1.31.2.patch"

RnJvbSAwM2EzMTU4YTNmNGRjMTgyMWQxNjFjYmE2YzYyODc1OGY5ZTcwZGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjo0NzoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMxLjEgLT4gMS4zMS4yCgotLS0KIC4uLi9tcGcxMjMve21wZzEyM18x
LjMxLjEuYmIgPT4gbXBnMTIzXzEuMzEuMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL21wZzEyMy97bXBnMTIzXzEuMzEuMS5iYiA9PiBtcGcxMjNfMS4zMS4y
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9t
cGcxMjNfMS4zMS4xLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18x
LjMxLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMxLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMS4yLmJiCmluZGV4IGE4YTIzNzdiZDQuLjBhMmQ4
NzBjZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4z
MS4yLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4
NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8k
e0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVkY2IwOTM2ZWZkNDRjYjU4MzQ5
OGI2NTg1ODQ1MjA2ZjAwMmE3YjE5ZDUwNjZhMjY4M2JlMzYxOTU0ZDk1NWEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYjE3ZjIyOTA1ZTMxZjQzYjZiNDAxZGZkZjZhNzFlZDExYmI3ZDA1NmY2OGRi
NDQ5ZDcwYjlmOWFlODM5YzdkZSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjM3LjMKCg==

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:624ba4825eb6f03e0a491e3d70bfb9119b2b7bc2"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 9 Mirrors 0 Missed 101 Current 422 (8% match, 81% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1442 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1443 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1453 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1468 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1475 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1490 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1506 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1518 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 1519 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1534 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1566 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_fetch)
NOTE: Running task 1567 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1568 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1569 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1597 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1598 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1599 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1600 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1601 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1602 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1603 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1604 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1609 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1615 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: Running task 1616 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_fetch)
NOTE: Running task 1617 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe ell-0.55-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: Running task 1619 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.55-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: Running task 1620 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: Running task 1621 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1622 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1623 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: Running task 1624 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: Running task 1625 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 1626 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: Running task 1627 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1628 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1629 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 1630 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1631 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1632 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 1633 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_unpack)
NOTE: Running task 1634 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1635 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1636 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1637 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: Running task 1638 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1639 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 1640 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: Running task 1641 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1642 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1643 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: Running task 1644 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1645 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1646 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: Running task 1647 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1648 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1649 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 1650 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1651 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1653 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1654 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 1655 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Started
NOTE: Running task 1656 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 1659 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1660 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.55-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1664 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_patch)
NOTE: Running task 1665 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1666 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1667 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 1669 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1670 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1671 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe ell-0.55-r0: task do_patch: Started
NOTE: Running task 1672 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Succeeded
NOTE: Running task 1673 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 1674 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1675 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1676 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1677 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 1678 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: Running task 1679 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1680 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1681 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: Running task 1682 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1683 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Started
NOTE: Running task 1684 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 1685 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1686 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1687 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1688 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1689 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1691 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1692 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1693 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 1694 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1695 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_deploy_source_date_epoch)
NOTE: Running task 1696 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Running task 1697 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1698 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1699 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1700 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1701 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1702 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 1703 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1704 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1705 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1706 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1707 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic unihash changed to a8c8647ab0c720a72efbfb8fec55073ae23b4a25a5e545384d6f0552def64e87
NOTE: Running task 1708 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1709 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1710 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1711 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: Running task 1712 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1713 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: recipe ell-0.55-r0: task do_configure: Started
NOTE: Running task 1714 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1715 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1716 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: Running task 1717 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1718 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1721 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 1724 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1725 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1726 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 1728 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1729 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: Running task 1734 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1736 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: Running task 1739 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1740 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1741 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1745 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: Running task 1746 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1747 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1748 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_compile)
NOTE: recipe ell-0.55-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1750 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1751 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1752 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1753 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1754 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1755 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1756 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1757 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1758 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1759 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1760 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.55-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_install)
NOTE: recipe ell-0.55-r0: task do_install: Started
NOTE: recipe ell-0.55-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 1764 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_package)
NOTE: Running task 1765 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1766 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1767 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe ell-0.55-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1773 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata)
NOTE: recipe ell-0.55-r0: task do_packagedata: Started
NOTE: recipe ell-0.55-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1773 tasks of which 1590 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/ell/0.55-r0/temp/log.do_packagedata.3859051
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata) failed with exit code '1'

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 149 recipes from the core2-32 sysroot...done.
Removing 176 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:624ba4825eb6f03e0a491e3d70bfb9119b2b7bc2"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 319 Local 222 Mirrors 0 Missed 97 Current 178 (69% match, 80% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 179 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 181 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 803 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 206 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 238 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 270 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 817 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 818 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 819 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 820 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 821 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 822 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 823 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 824 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 825 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 826 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 827 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 828 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 829 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 830 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_fetch)
NOTE: Running task 831 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 832 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 833 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 834 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 835 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 836 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 837 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 838 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 839 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 840 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.55-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 841 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: Running task 842 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 843 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 844 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 845 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 846 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 847 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe ell-0.55-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 848 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 850 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 851 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 852 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 853 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 854 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 856 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 857 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 858 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 859 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: Running task 860 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Started
NOTE: Running task 861 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: Running task 863 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe ell-0.55-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: Running setscene task 302 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 876 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 877 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running setscene task 316 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: Running task 882 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running task 883 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 884 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running setscene task 319 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 889 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 890 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 891 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 892 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: Running task 893 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 895 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 896 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running task 897 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 898 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 899 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 900 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 901 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.55-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 902 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running task 907 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 908 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 909 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running task 910 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_deploy_source_date_epoch)
NOTE: Running task 911 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 912 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 923 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 924 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 929 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 339 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 949 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 950 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running task 951 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: Running setscene task 342 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running task 957 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 958 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 959 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 962 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 963 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 964 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 345 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 970 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 971 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 348 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 972 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic unihash changed to a8c8647ab0c720a72efbfb8fec55073ae23b4a25a5e545384d6f0552def64e87
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 973 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: Running setscene task 350 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 352 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 982 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 368 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 987 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 997 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 388 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1026 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1060 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1069 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1070 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 497 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1452 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1470 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1474 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1487 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1504 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1519 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1544 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1554 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1555 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1556 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1562 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1563 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1575 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1576 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1578 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: Running task 1579 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1580 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1581 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 1582 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1583 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: Running task 1584 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1585 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.55-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: Running task 1586 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1590 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 1592 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Succeeded
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1595 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1597 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1600 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: Running task 1601 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1602 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: Running task 1603 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1604 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1605 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1608 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: Running task 1609 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1610 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1611 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1612 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1614 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: Running task 1615 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1616 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.55-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe ell-0.55-r0: task do_compile: Started
NOTE: Running task 1618 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1619 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1620 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1622 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe ell-0.55-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe ell-0.55-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1625 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: Running task 1626 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: recipe ell-0.55-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: Running task 1628 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_populate_sysroot)
NOTE: Running task 1629 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe ell-0.55-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1630 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1631 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1633 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1634 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.55-r0: task do_package: Succeeded
NOTE: Running task 1635 of 1736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata)
NOTE: recipe ell-0.55-r0: task do_packagedata: Started
NOTE: recipe ell-0.55-r0: task do_packagedata: Failed
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1635 tasks of which 1463 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ell/0.55-r0/temp/log.do_packagedata.4068519
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata) failed with exit code '1'

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:624ba4825eb6f03e0a491e3d70bfb9119b2b7bc2"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 9 Mirrors 0 Missed 101 Current 422 (8% match, 81% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1442 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1443 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1453 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1468 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1475 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1490 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1506 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1518 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1519 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 1534 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1566 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_fetch)
NOTE: Running task 1567 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1568 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1569 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1597 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1598 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1599 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1600 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1601 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1602 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1603 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1604 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1609 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1615 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: Running task 1616 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_fetch)
NOTE: Running task 1617 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 1618 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe ell-0.55-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1619 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: Running task 1620 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1621 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.55-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 1622 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1623 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 1624 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1625 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 1626 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1627 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1628 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 1629 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1630 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 1631 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1632 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: Running task 1633 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_unpack)
NOTE: Running task 1634 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1635 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1636 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: Running task 1637 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1638 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1639 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1640 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: Running task 1641 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: Running task 1642 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1643 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1644 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 1645 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1646 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1647 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1649 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1650 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 1651 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 1652 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1653 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Started
NOTE: Running task 1654 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 1655 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1656 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_patch)
NOTE: Running task 1659 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 1661 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1662 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: Running task 1664 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 1665 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1666 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1667 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_patch: Started
NOTE: Running task 1668 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1669 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_patch)
NOTE: Running task 1671 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1672 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1673 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1674 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: Running task 1675 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1677 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 1678 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1681 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Started
NOTE: Running task 1682 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1683 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 1684 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 1685 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1686 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Succeeded
NOTE: Running task 1687 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1688 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1689 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1691 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: Running task 1692 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1693 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1694 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe ell-0.55-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1695 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1696 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: Running task 1697 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: Running task 1698 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1699 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1700 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Running task 1701 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1702 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1703 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 1704 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: Running task 1705 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic unihash changed to a8c8647ab0c720a72efbfb8fec55073ae23b4a25a5e545384d6f0552def64e87
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1706 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1707 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1708 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_configure)
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1709 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1710 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1711 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1712 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: recipe ell-0.55-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: Running task 1713 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1714 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1715 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1717 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1718 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1721 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 1724 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1725 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1726 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 1728 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1729 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 1734 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 1736 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 1739 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1741 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1742 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1743 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1744 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: Running task 1746 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1747 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1748 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1750 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1751 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: Running task 1752 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_compile)
NOTE: recipe ell-0.55-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1754 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1755 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1756 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1757 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 1758 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe ell-0.55-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1761 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1762 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe ell-0.55-r0: task do_install: Succeeded
NOTE: Running task 1764 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_package)
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1766 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: Running task 1767 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 1768 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1772 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1773 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ell-0.55-r0: task do_package: Succeeded
NOTE: Running task 1774 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata)
NOTE: recipe ell-0.55-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1775 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe ell-0.55-r0: task do_packagedata: Failed
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1775 tasks of which 1590 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/ell/0.55-r0/temp/log.do_packagedata.3526553
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata) failed with exit code '1'

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.31.1.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.31.2.tar.bz2"
packages/core2-32-poky-linux/mpg123: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2009472 to 2009476 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1857457 to 1857527 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.31.1 [default] to 1.31.2 [default]

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:624ba4825eb6f03e0a491e3d70bfb9119b2b7bc2"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 9 Mirrors 0 Missed 101 Current 422 (8% match, 81% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1442 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1443 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1453 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1468 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1475 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1490 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1506 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1518 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1519 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 1534 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1566 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_fetch)
NOTE: Running task 1567 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1568 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1569 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1597 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1598 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1599 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1600 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1601 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1602 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1603 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1604 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1609 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1615 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: Running task 1616 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_fetch)
NOTE: Running task 1617 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe ell-0.55-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: Running task 1618 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1619 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.55-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1620 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1621 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1622 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1623 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1624 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1625 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 1626 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: Running task 1627 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: Running task 1628 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 1629 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1630 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 1631 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1632 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: Running task 1633 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_unpack)
NOTE: Running task 1634 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: Running task 1635 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1636 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1637 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1638 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: Running task 1639 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 1640 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1641 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1642 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1643 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1644 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1645 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1646 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: Running task 1647 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: Running task 1648 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: Running task 1649 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1650 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1651 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe ell-0.55-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1652 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 1653 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 1654 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1655 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1656 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: Running task 1658 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.55-r0: task do_unpack: Succeeded
NOTE: Running task 1659 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 1660 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 1661 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: Running task 1662 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1663 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1665 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 1666 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: Running task 1667 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: Running task 1669 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1671 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 1672 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 1673 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1674 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1675 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1676 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1677 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Started
NOTE: Running task 1678 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1679 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1680 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1681 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1682 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1683 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1684 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1685 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: Running task 1686 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1687 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1688 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 1689 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_patch: Succeeded
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1691 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 1692 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: Running task 1693 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_deploy_source_date_epoch)
NOTE: Running task 1694 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1695 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1696 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1697 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1698 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 1699 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1700 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1701 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1702 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic unihash changed to a8c8647ab0c720a72efbfb8fec55073ae23b4a25a5e545384d6f0552def64e87
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1703 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1704 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1705 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1706 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Running task 1707 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: Running task 1708 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: Running task 1709 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: Running task 1711 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1712 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1713 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1714 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1715 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1716 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1717 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1718 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1719 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1720 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1721 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 1722 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 1723 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 1724 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1725 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1726 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 1728 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1729 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1734 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1735 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1736 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 1737 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1738 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 1739 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1740 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1741 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1742 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1743 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1744 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1745 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1746 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1747 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1748 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1750 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1751 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe ell-0.55-r0: task do_configure: Succeeded
NOTE: Running task 1753 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_compile)
NOTE: recipe ell-0.55-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: Running task 1755 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1756 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1757 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1758 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1759 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1760 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_install)
NOTE: recipe ell-0.55-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1763 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe ell-0.55-r0: task do_install: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: Running task 1765 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_populate_sysroot)
NOTE: Running task 1766 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Started
NOTE: Running task 1767 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.55-r0: task do_package: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1768 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1769 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1770 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1771 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1772 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1773 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1774 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe ell-0.55-r0: task do_package: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: Running task 1775 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata)
NOTE: recipe ell-0.55-r0: task do_packagedata: Started
NOTE: recipe ell-0.55-r0: task do_packagedata: Failed
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1775 tasks of which 1590 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ell/0.55-r0/temp/log.do_packagedata.3386546
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata) failed with exit code '1'

--===============7856573351411553736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:624ba4825eb6f03e0a491e3d70bfb9119b2b7bc2"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 9 Mirrors 0 Missed 101 Current 418 (8% match, 80% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1426 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_fetch)
NOTE: Running task 1430 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1431 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1441 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_fetch)
NOTE: Running task 1456 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1463 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1478 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1494 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1506 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 1507 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1522 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1554 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_fetch)
NOTE: Running task 1555 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1556 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_fetch)
NOTE: Running task 1557 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: Running task 1583 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1584 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1585 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1586 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1587 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1588 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1589 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1590 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1595 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 1601 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: Running task 1602 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_fetch)
NOTE: Running task 1603 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe vala-0.56.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: recipe icu-72-1-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe vala-0.56.3-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe ell-0.55-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Started
NOTE: Running task 1604 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1605 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_unpack)
NOTE: Running task 1606 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.55-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: Running task 1607 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_unpack)
NOTE: recipe libxi-1_1.8-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1608 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: Running task 1609 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 1610 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: Running task 1611 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1612 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1613 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1614 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 1615 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 1616 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1617 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1618 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1619 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_unpack)
NOTE: recipe mpg123-1.31.2-r0: task do_fetch: Succeeded
NOTE: Running task 1620 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1621 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_unpack)
NOTE: Running task 1622 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: Running task 1623 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: Running task 1624 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 1625 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 1626 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1627 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: Running task 1628 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Started
NOTE: Running task 1630 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 1631 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1632 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 1633 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 1634 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1635 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-72-1-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1636 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe ell-0.55-r0: task do_unpack: Started
NOTE: Running task 1637 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: Running task 1638 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: Running task 1639 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Started
NOTE: Running task 1641 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1642 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1643 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1644 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_patch)
NOTE: Running task 1645 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 1646 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1647 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 1648 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 1649 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_patch: Started
NOTE: Running task 1650 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1651 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe ell-0.55-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 1653 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1654 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 1655 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: Running task 1656 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_patch: Succeeded
NOTE: Running task 1657 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: Running task 1658 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1659 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1660 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1661 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Started
NOTE: Running task 1662 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1663 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_patch)
NOTE: Running task 1664 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1665 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1666 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: Running task 1667 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1668 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1669 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1670 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 1671 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1672 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_patch: Succeeded
NOTE: Running task 1673 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1674 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1675 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1676 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Started
NOTE: Running task 1677 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1678 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_patch: Succeeded
NOTE: Running task 1679 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: Running task 1680 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 1681 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 1682 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb:do_populate_lic unihash changed to a8c8647ab0c720a72efbfb8fec55073ae23b4a25a5e545384d6f0552def64e87
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe mpg123-1.31.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1683 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: Running task 1684 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1685 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1686 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1687 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.55-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1688 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe vala-0.56.3-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1689 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1690 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ell-0.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1691 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ell-0.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1692 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_patch)
NOTE: Running task 1693 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: Running task 1694 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_configure)
NOTE: Running task 1695 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe icu-72-1-r0: task do_patch: Started
NOTE: recipe ell-0.55-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1696 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe icu-72-1-r0: task do_patch: Succeeded
NOTE: Running task 1697 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_make_icudata)
NOTE: Running task 1698 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: recipe icu-72-1-r0: task do_make_icudata: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1699 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1700 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: Running task 1701 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1702 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe icu-72-1-r0: task do_make_icudata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1703 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe icu-72-1-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1704 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe libxi-1_1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Started
NOTE: Running task 1706 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_compile: Succeeded
NOTE: Running task 1707 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_install: Succeeded
NOTE: Running task 1708 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 1709 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1710 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1711 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_package: Succeeded
NOTE: Running task 1712 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1713 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 1714 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 1715 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 1716 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 1717 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 1718 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_configure: Succeeded
NOTE: Running task 1719 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_configure: Succeeded
NOTE: Running task 1720 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_compile)
NOTE: recipe vala-0.56.3-r0: task do_compile: Started
NOTE: recipe icu-72-1-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 1723 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 1726 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 1730 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1732 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1733 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1734 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1735 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8-r0: task do_configure: Succeeded
NOTE: Running task 1736 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1737 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: Running task 1738 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1739 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1740 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_configure: Succeeded
NOTE: Running task 1741 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_compile)
NOTE: recipe ell-0.55-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1743 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1744 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_install: Succeeded
NOTE: Running task 1745 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot)
NOTE: Running task 1746 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_package)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_package: Started
NOTE: recipe ell-0.55-r0: task do_compile: Succeeded
NOTE: Running task 1747 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_install)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1748 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Started
NOTE: recipe ell-0.55-r0: task do_install: Succeeded
NOTE: Running task 1750 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_populate_sysroot)
NOTE: Running task 1751 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_package)
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_package: Started
NOTE: recipe ell-0.55-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.8-r0: task do_package: Succeeded
NOTE: Running task 1753 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1754 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: Running task 1755 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1757 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.55-r0: task do_package: Succeeded
NOTE: Running task 1758 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata)
NOTE: recipe ell-0.55-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: recipe ell-0.55-r0: task do_packagedata: Failed
NOTE: Running task 1760 of 1850 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_configure: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_compile: Succeeded
NOTE: recipe icu-72-1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1760 tasks of which 1576 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-src went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dbg went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-staticdev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-dev went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-doc went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell-locale went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: QA Issue: Package version for package ell went backwards which would break package feeds (from 0:0.56-r0 to 0:0.55-r0) [version-going-backwards]
ERROR: ell-0.55-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/ell/0.55-r0/temp/log.do_packagedata.3682445
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.55.bb:do_packagedata) failed with exit code '1'

--===============7856573351411553736==--

