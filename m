Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCC1C4708A
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.878.1667349634101442584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lqjAy48L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018435c8624e-90103013-2222-4a33-9c59-7247fd9ed33c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=rXBdLJMByfiwlpEnmO555DUDWipLeo3pdwP2yuTXjdo=;
	b=lqjAy48L+/qcRRxzi9k3e15WaY6LCynli+Eh6yckp2d4vwqtkzi8xlrvssq5ahUr
	5DUO67zUz21RDIGUOC2s2dIAs7Xyr+qENltH8mBBRFyjb4SDC4GQYK8A8daC25+Aqc8
	KvmVOhTna1B1ejLaga3psfTpu0KloDRTe5OAjMfY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=rXBdLJMByfiwlpEnmO555DUDWipLeo3pdwP2yuTXjdo=;
	b=e5QBxEqusD6n2dpDdGIYcg9dunaj5LypFAaiMoJpvOa659IQsIJdIvBG009lUoyt
	74RqZdiwd/+NKfs/B3KRjRCeWdTlpiaelvAxvavGiMGaFnrc+ZVe1UW2E4YgVupU+sA
	l/dE1XvflfkTSD+qf1yE7MhNsOo0vihFLiifUm5E=
Content-Type: multipart/mixed; boundary="===============3288280532456833096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.4 SUCCEEDED
Message-ID: <0101018435c8624e-90103013-2222-4a33-9c59-7247fd9ed33c-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172484

--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.3-22.1.4.patch
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
--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.3.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.4.tar.xz"
packages/core2-32-poky-linux/xwayland: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10273608 to 10280800 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8596077 to 8604104 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.3" to "22.1.4"
packages/core2-32-poky-linux/xwayland/xwayland: PKGSIZE changed from 2409052 to 2417276 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.3 [default] to 22.1.4 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.3" to "22.1.4"

--===============3288280532456833096==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.3-22.1.4.patch"

RnJvbSBkNThmYThjMTMzYjIyYjljNDk0YWI3MTA4YzlkYmMzN2YyNDEzNDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNzo0NzowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDIyLjEuMyAtPiAyMi4xLjQKCi0tLQogLi4uL3h3YXlsYW5kL3t4d2F5
bGFuZF8yMi4xLjMuYmIgPT4geHdheWxhbmRfMjIuMS40LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yMi4xLjMuYmIgPT4geHdheWxhbmRf
MjIuMS40LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yMi4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQv
eHdheWxhbmRfMjIuMS40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMi4xLjMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMi4xLjQuYmIKaW5kZXggZGEx
YjI3NTI1ZC4uODU5N2QwN2E3ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIyLjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjIuMS40LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMy
YzU4MjIwOTQ1NTNlYTE4ODAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2
ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImE3MTJlYjdiY2UzMmNkOTM0ZGYzNjgxNGI1ZGQwNDZhYTY3MDg5OWMxNmZlOThm
MmFmYjAwMzU3OGY4NmExYzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWMzOWJkZDc3NDQ0YzNm
YTdhMGUyZWYzMTdhZTY5ZGRkZTg5YTkwMWRjODkxNGRiYzhlYWMzOWE5MzEzNTEyYSIKIAogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCsp
KylcLnRhciIKIAotLSAKMi4zMS4xCgo=

--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:156cdb90ebb60fca024ad09047afbbd7149b1554"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 25 Mirrors 0 Missed 36 Current 367 (40% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 371 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1193 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1228 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1245 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1299 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1300 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1301 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1393 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_fetch)
NOTE: Running task 1408 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1410 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1411 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1416 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_write_config)
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1418 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: Running task 1419 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1421 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Started
NOTE: Running task 1422 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1423 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1424 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1425 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_unpack)
NOTE: Running task 1427 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1428 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/pixman/1_0.40.0-r0/temp/log.do_packagedata_setscene.509517
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.224.1-r0/temp/log.do_packagedata_setscene.509513
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 425 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1432 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1433 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 1434 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1435 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_patch)
NOTE: Running task 1436 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1439 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1440 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1441 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1442 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1443 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1444 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 1448 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic unihash changed to 71d9f21197f9b24536707f103e225843a82283f3e7bae368d3295fec8e0f3c93
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1471 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: Running task 1475 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1494 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1501 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1507 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1515 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 1519 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1520 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 1522 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1523 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1525 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1526 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1531 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1534 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_compile)
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_install)
NOTE: recipe xwayland-22.1.4-r0: task do_install: Started
NOTE: recipe xwayland-22.1.4-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package)
NOTE: Running task 1537 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_package: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package: Succeeded
NOTE: Running task 1538 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_packagedata)
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1539 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_write_rpm)
NOTE: Running task 1540 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_qa)
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1541 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1541 tasks of which 1443 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-src went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dbg went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-staticdev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-doc went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-locale went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 55 recipes from the core2-32 sysroot...done.
Removing 55 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:156cdb90ebb60fca024ad09047afbbd7149b1554"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 251 Local 215 Mirrors 0 Missed 36 Current 178 (85% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 745 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 770 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 777 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 779 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 780 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 781 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 845 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_fetch)
NOTE: Running task 846 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 847 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 848 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 851 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_write_config)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: Running task 852 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 853 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Started
NOTE: Running task 854 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: Running task 855 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running task 856 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 857 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/pixman/1_0.40.0-r0/temp/log.do_packagedata_setscene.767129
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 233 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_setscene)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 236 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_package_setscene)
NOTE: Running setscene task 237 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: Running task 860 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 861 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 863 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 865 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 866 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 867 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 869 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_patch)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 871 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 872 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 873 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Succeeded
NOTE: Running task 874 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 875 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 876 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic)
NOTE: Running task 877 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 882 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic unihash changed to 71d9f21197f9b24536707f103e225843a82283f3e7bae368d3295fec8e0f3c93
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 883 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 884 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 242 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 258 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 264 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.224.1-r0/temp/log.do_packagedata_setscene.772200
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 282 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 291 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 304 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 352 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 356 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1443 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: Running task 1445 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1470 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1471 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1483 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1488 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_package_write_rpm)
NOTE: Running task 1489 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: Running task 1495 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1496 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1499 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1500 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1501 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1502 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1503 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: Running task 1505 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1508 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: Running task 1513 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: Running task 1515 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 1516 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1519 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1520 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1521 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 1523 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1526 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1527 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1528 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1530 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1531 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1532 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_compile)
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_install)
NOTE: recipe xwayland-22.1.4-r0: task do_install: Started
NOTE: recipe xwayland-22.1.4-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package)
NOTE: Running task 1538 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_package: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_packagedata)
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_write_rpm)
NOTE: Running task 1541 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_qa)
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1542 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1542 tasks of which 1444 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-src went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dbg went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-staticdev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-doc went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-locale went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:156cdb90ebb60fca024ad09047afbbd7149b1554"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 25 Mirrors 0 Missed 36 Current 367 (40% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 371 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1193 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1228 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1245 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1299 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1300 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1301 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1393 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_fetch)
NOTE: Running task 1408 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1410 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1411 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1416 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_write_config)
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: Running task 1418 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 1419 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1421 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1422 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Started
NOTE: Running task 1423 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1424 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1425 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_unpack)
NOTE: Running task 1426 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1427 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1428 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.224.1-r0/temp/log.do_packagedata_setscene.569745
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 425 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package_setscene)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/pixman/1_0.40.0-r0/temp/log.do_packagedata_setscene.569748
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_setscene)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1430 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 1431 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1432 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1433 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1434 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 1435 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_patch)
NOTE: Running task 1436 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1440 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1442 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1444 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1445 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic unihash changed to 71d9f21197f9b24536707f103e225843a82283f3e7bae368d3295fec8e0f3c93
NOTE: Running task 1448 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1471 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: Running task 1478 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1494 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1501 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1507 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1515 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1517 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 1520 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 1523 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1525 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 1526 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1531 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1534 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_compile)
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_install)
NOTE: recipe xwayland-22.1.4-r0: task do_install: Started
NOTE: recipe xwayland-22.1.4-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package)
NOTE: Running task 1537 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package: Succeeded
NOTE: Running task 1538 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_packagedata)
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1539 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_write_rpm)
NOTE: Running task 1540 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_qa)
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1541 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1541 tasks of which 1443 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-src went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dbg went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-staticdev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-doc went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-locale went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:156cdb90ebb60fca024ad09047afbbd7149b1554"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 25 Mirrors 0 Missed 36 Current 367 (40% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 371 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1192 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1228 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1244 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1299 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1300 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1301 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1393 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_fetch)
NOTE: Running task 1408 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1410 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1411 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1416 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_write_config)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: Running task 1418 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 1419 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1420 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1422 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1423 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1424 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1425 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_unpack)
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Started
NOTE: Running task 1426 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1427 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1428 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.224.1-r0/temp/log.do_packagedata_setscene.648691
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 425 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package_setscene)
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/pixman/1_0.40.0-r0/temp/log.do_packagedata_setscene.648695
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1431 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: Running task 1432 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1433 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 1434 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1435 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1440 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1441 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1444 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1445 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Started
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1446 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic unihash changed to 71d9f21197f9b24536707f103e225843a82283f3e7bae368d3295fec8e0f3c93
NOTE: Running task 1448 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1449 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1471 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: Running task 1475 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1494 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1501 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1507 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1515 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 1519 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: Running task 1520 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: Running task 1521 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1525 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1526 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1531 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1534 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_compile)
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_install)
NOTE: recipe xwayland-22.1.4-r0: task do_install: Started
NOTE: recipe xwayland-22.1.4-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package)
NOTE: Running task 1537 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_package: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package: Succeeded
NOTE: Running task 1538 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_packagedata)
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1539 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_write_rpm)
NOTE: Running task 1540 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_qa)
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1541 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1541 tasks of which 1443 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-src went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dbg went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-staticdev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-doc went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-locale went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3288280532456833096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:156cdb90ebb60fca024ad09047afbbd7149b1554"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 24 Mirrors 0 Missed 36 Current 368 (40% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 371 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1192 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1228 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1244 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1299 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1300 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1301 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1393 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_fetch)
NOTE: Running task 1408 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1410 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1411 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1416 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_write_config)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1418 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 1419 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: Running task 1420 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 1421 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1422 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Started
NOTE: Running task 1423 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1424 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1425 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1427 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1428 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.224.1-r0/temp/log.do_packagedata_setscene.439541
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 425 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package_setscene)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/pixman/1_0.40.0-r0/temp/log.do_packagedata_setscene.439554
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_setscene)
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 1432 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1433 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1434 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 1435 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_patch)
NOTE: Running task 1436 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1441 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1442 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1444 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Started
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_lic unihash changed to 71d9f21197f9b24536707f103e225843a82283f3e7bae368d3295fec8e0f3c93
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Running task 1448 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: Running task 1449 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1471 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: Running task 1475 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1494 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1501 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: Running task 1507 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 1513 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1517 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: Running task 1518 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1519 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1522 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1523 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1525 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1526 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1531 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_configure)
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1534 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_compile)
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_install)
NOTE: recipe xwayland-22.1.4-r0: task do_install: Started
NOTE: recipe xwayland-22.1.4-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package)
NOTE: Running task 1537 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.4-r0: task do_package: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package: Succeeded
NOTE: Running task 1538 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_packagedata)
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1539 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_write_rpm)
NOTE: Running task 1540 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_package_qa)
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1541 of 1541 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1541 tasks of which 1443 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-src went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.231.1-r0 to 0:1.3.224.1-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dbg went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.224.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-staticdev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-dev went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-doc went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman-locale went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package pixman went backwards which would break package feeds (from 1:0.42.0-r0 to 1:0.40.0-r0) [version-going-backwards]
ERROR: pixman-1_0.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3288280532456833096==--

