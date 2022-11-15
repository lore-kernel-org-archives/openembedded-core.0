Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6D3C64E78
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.5229.1668517537434174772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JxxFd9d/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101847b652339-39c7fa3e-7645-4392-9e05-44ebe0db2a68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=UZCkBWCcmZg/WJlD+HN6uRqK9IytONwtofRMidvQPXA=;
	b=JxxFd9d//P4B0k2d9TH2fYQGV/do8bkXF3Jx81WPJSgrisyVTor0lJjrF21dXqvv
	11XmVFVGNYNxpFuNHcYUH2uq1rK8dY0rKXR9y2GNXSZWz4D6byWomz+EffBP0CBrlU/
	S2ThNqZSnhSPu0YuwSNcIV2xp7UhWj9ggTCwaR28=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=UZCkBWCcmZg/WJlD+HN6uRqK9IytONwtofRMidvQPXA=;
	b=U23OccxUXLs5Fa3h0wPT9yOc2BwrdplfWDCFc4u+KjKxkOD+Bj1IsfBOEBOhHb2x
	O/Tgb81QNNGSMqpuCBuYUmLR1S9EauskkFU/APc3mzMiKdls4bWdo7YH3DMECA/oVdy
	KS7hAtWr2QyTITt9olP6kttNHpgNlA5/oS+dQd34=
Content-Type: multipart/mixed; boundary="===============8089598225055668046=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.5 SUCCEEDED
Message-ID: <010101847b652339-39c7fa3e-7645-4392-9e05-44ebe0db2a68-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173335

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.4-22.1.5.patch
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
--===============8089598225055668046==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.4-22.1.5.patch"

RnJvbSAwNWUwNjc2YzllNWIxYTgzYzFmN2ExM2E3NDc4YWJhMmMzMmE4MGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTE6MDk6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyMi4xLjQgLT4gMjIuMS41CgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjIuMS40LmJiID0+IHh3YXlsYW5kXzIyLjEuNS5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjIuMS40LmJiID0+IHh3YXlsYW5k
XzIyLjEuNS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjIuMS40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzIyLjEuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjIuMS40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjIuMS41LmJiCmluZGV4IDg1
OTdkMDdhN2QuLmMxYzU0MDdkZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yMi4xLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIyLjEuNS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI1YzM5YmRkNzc0NDRjM2ZhN2EwZTJlZjMxN2FlNjlkZGRlODlhOTAxZGM4OTE0
ZGJjOGVhYzM5YTkzMTM1MTJhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUzMTdhYzFmMTE5Zjgz
MjE2NTQ5MjE3NjE0MjA5MDFlNGFiZDk1NTg1YThjNzYzY2UyNmFmM2IwNDVhYzE2NzIiCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuMzEuMQoK

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f374185264ebd025bf998a555361f624017fd679"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 76 Local 40 Mirrors 0 Missed 36 Current 353 (52% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1173 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1208 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_fetch)
NOTE: Running task 1223 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1260 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1261 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1262 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1349 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_fetch)
NOTE: Running task 1356 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1361 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1362 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1371 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_write_config)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1376 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1377 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_unpack)
NOTE: Running task 1378 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1379 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1380 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_unpack)
NOTE: Running task 1381 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 1382 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1383 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1384 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libx11/1_1.8.1-r0/temp/log.do_packagedata_setscene.2642989
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package_setscene)
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1387 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 1388 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_patch)
NOTE: Running task 1389 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1390 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1391 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_patch)
NOTE: Running task 1392 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1393 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1397 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1398 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic unihash changed to c0b3a4b5fbc22aa6fb6ad0791ad1a0d8e4d63327998ac160058d3d5fc07a74fd
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Running task 1405 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1416 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: Running task 1466 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1468 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1489 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package_write_rpm)
NOTE: Running task 1490 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: Running task 1493 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 1496 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
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
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_package)
NOTE: Running task 1508 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1514 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1515 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1516 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1518 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1519 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1520 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 1522 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 1524 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1525 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1526 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 1527 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
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
NOTE: Running task 1532 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_configure)
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_compile)
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_install)
NOTE: recipe xwayland-22.1.5-r0: task do_install: Started
NOTE: recipe xwayland-22.1.5-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package)
NOTE: Running task 1538 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_package: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_packagedata)
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_write_rpm)
NOTE: Running task 1541 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_qa)
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1542 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1542 tasks of which 1445 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f374185264ebd025bf998a555361f624017fd679"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 76 Local 40 Mirrors 0 Missed 36 Current 353 (52% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1173 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1208 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_fetch)
NOTE: Running task 1223 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1259 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1261 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1262 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1349 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_fetch)
NOTE: Running task 1356 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1358 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1362 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1371 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_write_config)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 1376 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_unpack)
NOTE: Running task 1377 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1378 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1379 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1380 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_unpack)
NOTE: Running task 1381 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 1382 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1383 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 1384 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libx11/1_1.8.1-r0/temp/log.do_packagedata_setscene.2614619
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package_setscene)
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1387 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 1388 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_patch)
NOTE: Running task 1389 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1390 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1391 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_patch)
NOTE: Running task 1392 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Started
NOTE: Running task 1394 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1395 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running task 1396 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1397 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1398 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1399 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic unihash changed to c0b3a4b5fbc22aa6fb6ad0791ad1a0d8e4d63327998ac160058d3d5fc07a74fd
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Running task 1405 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1416 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: Running task 1466 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1468 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 1496 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
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
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_package)
NOTE: Running task 1508 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1514 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1515 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1516 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 1518 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 1521 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1522 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 1523 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
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
NOTE: Running task 1532 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_configure)
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_compile)
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_install)
NOTE: recipe xwayland-22.1.5-r0: task do_install: Started
NOTE: recipe xwayland-22.1.5-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package)
NOTE: Running task 1538 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_package: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_packagedata)
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_write_rpm)
NOTE: Running task 1541 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_qa)
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1542 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1542 tasks of which 1445 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (886 cached, 1 parsed). 1665 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f374185264ebd025bf998a555361f624017fd679"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 76 Local 40 Mirrors 0 Missed 36 Current 353 (52% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1172 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1208 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_fetch)
NOTE: Running task 1222 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1259 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1260 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1261 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1349 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_fetch)
NOTE: Running task 1356 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1358 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1359 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1371 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_write_config)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 1376 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1377 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1378 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_unpack)
NOTE: Running task 1379 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1380 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_unpack)
NOTE: Running task 1381 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Succeeded
NOTE: Running task 1382 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1383 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1384 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libx11/1_1.8.1-r0/temp/log.do_packagedata_setscene.2586295
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1387 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 1388 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_patch)
NOTE: Running task 1389 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1390 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1391 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_patch)
NOTE: Running task 1392 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1396 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1397 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1398 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1401 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic unihash changed to c0b3a4b5fbc22aa6fb6ad0791ad1a0d8e4d63327998ac160058d3d5fc07a74fd
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1405 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1416 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: Running task 1466 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1468 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_configure)
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: Running task 1492 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: Running task 1497 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
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
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_package)
NOTE: Running task 1508 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: Running task 1515 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 1516 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1519 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1520 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 1521 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1522 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
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
NOTE: Running task 1532 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_configure)
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_compile)
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_install)
NOTE: recipe xwayland-22.1.5-r0: task do_install: Started
NOTE: recipe xwayland-22.1.5-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package)
NOTE: Running task 1538 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_package: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_packagedata)
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_write_rpm)
NOTE: Running task 1541 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_qa)
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1542 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1542 tasks of which 1445 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1665 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f374185264ebd025bf998a555361f624017fd679"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 76 Local 40 Mirrors 0 Missed 36 Current 353 (52% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 376 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1173 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1208 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_fetch)
NOTE: Running task 1223 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 1259 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1260 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1261 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1349 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_fetch)
NOTE: Running task 1356 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1358 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1359 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1371 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_write_config)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Started
NOTE: Running task 1375 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1376 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_unpack)
NOTE: Running task 1377 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 1378 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 1379 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1380 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 1381 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1382 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 1383 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe wayland-protocols-1.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1384 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Succeeded
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libx11/1_1.8.1-r0/temp/log.do_packagedata_setscene.2670931
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package_setscene)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1387 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: Running task 1388 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_patch)
NOTE: Running task 1389 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: Running task 1390 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1391 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_patch)
NOTE: Running task 1392 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1396 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1397 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1398 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1402 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic unihash changed to c0b3a4b5fbc22aa6fb6ad0791ad1a0d8e4d63327998ac160058d3d5fc07a74fd
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Running task 1405 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1416 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: Running task 1466 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1468 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package_write_rpm)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_configure)
NOTE: Running task 1491 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1494 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1495 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
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
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1504 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_package)
NOTE: Running task 1508 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1509 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1510 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1514 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1515 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1516 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1517 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 1518 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 1521 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1522 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 1523 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
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
NOTE: Running task 1532 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_configure)
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_compile)
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_install)
NOTE: recipe xwayland-22.1.5-r0: task do_install: Started
NOTE: recipe xwayland-22.1.5-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package)
NOTE: Running task 1538 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_package: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_packagedata)
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_write_rpm)
NOTE: Running task 1541 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_qa)
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1542 of 1542 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1542 tasks of which 1445 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (0 cached, 887 parsed). 1666 targets, 49 skipped, 0 masked, 0 errors.
Removing 56 recipes from the core2-32 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f374185264ebd025bf998a555361f624017fd679"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 260 Local 224 Mirrors 0 Missed 36 Current 170 (86% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 183 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 737 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 764 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_fetch)
NOTE: Running task 771 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_fetch)
NOTE: Running task 773 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 774 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 775 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 845 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_fetch)
NOTE: Running task 846 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 847 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 848 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 851 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_write_config)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: Running task 853 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_unpack)
NOTE: Running task 854 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_unpack)
NOTE: Running task 855 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 856 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 857 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: Running task 858 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 859 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe xwayland-22.1.5-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Started
NOTE: Running setscene task 234 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 869 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_patch)
NOTE: Running task 872 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 239 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package_setscene)
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 879 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 880 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 881 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 882 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_patch)
NOTE: Running task 884 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 885 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.5-r0: task do_patch: Succeeded
NOTE: Running task 886 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 887 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic)
NOTE: Running task 888 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 889 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_lic unihash changed to c0b3a4b5fbc22aa6fb6ad0791ad1a0d8e4d63327998ac160058d3d5fc07a74fd
NOTE: recipe xwayland-22.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 242 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 245 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 264 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 283 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libx11/1_1.8.1-r0/temp/log.do_packagedata_setscene.2702761
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 307 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_package_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 341 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_package_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 402 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1333 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata)
NOTE: Running task 1439 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1488 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_package_write_rpm)
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1489 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1491 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1494 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 1495 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1496 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1497 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1501 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1502 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1503 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1504 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1505 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_package)
NOTE: Running task 1509 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1510 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1511 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1517 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 1519 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1521 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1522 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.6.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 1527 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1528 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1530 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1532 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1533 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_configure)
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_compile)
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Started
NOTE: recipe xwayland-22.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1537 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_install)
NOTE: recipe xwayland-22.1.5-r0: task do_install: Started
NOTE: recipe xwayland-22.1.5-r0: task do_install: Succeeded
NOTE: Running task 1538 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package)
NOTE: Running task 1539 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_populate_sysroot)
NOTE: recipe xwayland-22.1.5-r0: task do_package: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe xwayland-22.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package: Succeeded
NOTE: Running task 1540 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_packagedata)
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Started
NOTE: recipe xwayland-22.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1541 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_write_rpm)
NOTE: Running task 1542 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_package_qa)
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Started
NOTE: recipe xwayland-22.1.5-r0: task do_package_qa: Succeeded
NOTE: recipe xwayland-22.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1543 of 1543 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1543 tasks of which 1446 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.2-r0 to 1:1.8.1-r0) [version-going-backwards]
ERROR: libx11-1_1.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8089598225055668046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.4.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.5.tar.xz"
packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10281172 to 10281436 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8604104 to 8602200 (-0%)
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.4 [default] to 22.1.5 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.4" to "22.1.5"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.4 [default] to 22.1.5 [default]

--===============8089598225055668046==--

