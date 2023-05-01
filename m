Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B68CA9EBB
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.107439.1682976352395175064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=h4h/movV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010187d9352abd-15145a5c-841f-4de0-956d-77ba9c7cbdc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RaXeBJItPtHD+FPKNH/BkDBW69mHk0ha8BHoA7CtrKk=;
	b=h4h/movV5pK2Nb0BYltRWaFt/YV6x7jQ7ysdGPh8hWdCNvWM1jHc50O4l7z1f6kW
	IDcS52ybe/FTOlaa3GZQ+kH1iwR48vXTp/MagjuEboTcTzrhFwopGKQfdi4KBxQZi00
	hY3xxP8mydy43yGrEDNhM1O2Mtm7BZfwisQ2JuuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RaXeBJItPtHD+FPKNH/BkDBW69mHk0ha8BHoA7CtrKk=;
	b=qAI6IOnyI4npxeJGrBCTIndZQsl6UjFaodutCigRiJ6/rHgwYYuYcivlqT82grkD
	yi9OD7pi03qmF7ennfcBf9jHL3JnMw1wBkBFONDFcOlGAt8jkE8492Tu/3oebva9ceY
	utotCnA20Eb/VZnRjY4edoUUIokEu+ZqGEzSUeLM=
Content-Type: multipart/mixed; boundary="===============8108017743584037000=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-libinput: upgrading to 1.3.0 SUCCEEDED
Message-ID: <01010187d9352abd-15145a5c-841f-4de0-956d-77ba9c7cbdc3-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180678

--===============8108017743584037000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xf86-input-libinput* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xf86-input-libinput-upgrade-1.2.1-1.3.0.patch
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
--===============8108017743584037000==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-libinput-upgrade-1.2.1-1.3.0.patch"

RnJvbSA4YTlhNDM5OWZhNWM3OTFlYTc0NzcxMjg5MDNhNjAyNDQ3YTYzNDBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxODo1MzozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhm
ODYtaW5wdXQtbGliaW5wdXQ6IHVwZ3JhZGUgMS4yLjEgLT4gMS4zLjAKCi0tLQogLi4uZjg2LWlu
cHV0LWxpYmlucHV0XzEuMi4xLmJiID0+IHhmODYtaW5wdXQtbGliaW5wdXRfMS4zLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3t4Zjg2LWlucHV0LWxpYmlucHV0
XzEuMi4xLmJiID0+IHhmODYtaW5wdXQtbGliaW5wdXRfMS4zLjAuYmJ9ICg3NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbGliaW5w
dXRfMS4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni1pbnB1
dC1saWJpbnB1dF8xLjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1kcml2ZXIveGY4Ni1pbnB1dC1saWJpbnB1dF8xLjIuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQt
bGliaW5wdXRfMS4zLjAuYmIKaW5kZXggZTFjNDdhYTVlNy4uODkyMDQ2ZTk1OSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbGliaW5wdXRf
MS4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5w
dXQtbGliaW5wdXRfMS4zLjAuYmIKQEAgLTcsNiArNyw2IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWEyMjkyNTEyN2JkM2M4MjdjMzg0Y2VkZDIzZWQyMzA5IgogREVQ
RU5EUyArPSAibGliaW5wdXQiCiAKIFhPUkdfRFJJVkVSX0NPTVBSRVNTT1IgPSAiLnRhci54eiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MTUxZGI1YjlkZGIzMTdjMGNlOTJkY2I2MmRhOWE4ZGI1
MDc5ZTViOGE5NWI2MGFiYzg1NGRhMjFlN2U5NzFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE0
NDZiYTIwYTIyYmM5NjhiNWE0YTBiNGRiYzNiOGUwMzdjNTBkOWM1OWFjNzVmYTNmN2ZjNTA2YzU4
YzFhYmIiCiAKIEZJTEVTOiR7UE59ICs9ICIke2RhdGFkaXJ9L1gxMS94b3JnLmNvbmYuZCIKLS0g
CjIuMzkuMgoK

--===============8108017743584037000==
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
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 24 Mirrors 0 Missed 43 Current 491 (35% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 502 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.2419669
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 557 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1367 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1368 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1406 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1494 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1562 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1586 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1646 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1647 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1648 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 1723 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1760 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1767 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1774 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: Running task 1775 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1776 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1777 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1798 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1825 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1826 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1827 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 1828 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1829 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1830 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1831 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: Running task 1832 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1833 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 1834 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1835 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1836 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1838 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1841 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 1842 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: Running task 1844 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1859 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1867 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1876 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1877 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: Running task 1880 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: Running task 1882 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 1883 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 76218b70f9df79b8152b46f5730858b69862a2418932ec834bebe34698bfd4d8
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: Running task 1884 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1898 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1899 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1903 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1904 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1906 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1908 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1909 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1912 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1917 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1920 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1921 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: Running task 1922 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1923 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1925 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1926 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1930 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1931 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1933 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1935 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1936 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: Running task 1937 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1938 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1942 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1945 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1946 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1948 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1949 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1950 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1951 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1952 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1955 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1956 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1957 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1958 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1959 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1960 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1960 tasks of which 1839 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8108017743584037000==
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
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 24 Mirrors 0 Missed 43 Current 487 (35% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 498 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.2462278
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 553 of 554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1357 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1359 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1395 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1482 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1550 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1574 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1633 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1634 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1635 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 1711 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1748 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1753 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: Running task 1762 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1763 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1764 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1765 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1784 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1811 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1812 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 1813 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1814 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1815 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1816 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1817 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1818 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1819 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1820 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1821 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 1822 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1823 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 1824 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1825 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: Running task 1827 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1828 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: Running task 1829 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1851 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 1852 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: Running task 1859 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1860 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1861 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1862 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1863 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 1864 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1865 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1867 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 76218b70f9df79b8152b46f5730858b69862a2418932ec834bebe34698bfd4d8
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1868 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: Running task 1869 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1876 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1877 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1883 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1884 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1885 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1886 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1887 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1888 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1889 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1890 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1894 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1896 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1897 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1898 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1899 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1902 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1903 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1905 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1906 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1909 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1911 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1912 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1914 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1915 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1916 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1917 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1920 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1921 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1922 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: Running task 1923 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1924 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1927 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1928 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1929 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1932 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1933 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1934 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1935 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1936 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1937 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1938 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1942 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1944 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1945 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1946 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1946 tasks of which 1825 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8108017743584037000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-libinput: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.2.1.tar.xz" to "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.3.0.tar.xz"
packages/core2-32-poky-linux/xf86-input-libinput: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGSIZE changed from 213640 to 221556 (+4%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGSIZE changed from 9974 to 10867 (+9%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGSIZE changed from 17951 to 19140 (+7%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: FILELIST: removed "/usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/bezier.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/draglock.h /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/xf86libinput.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/draglock.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/bezier.h", added "/usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/util-strings.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/util-strings.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/bezier.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/draglock.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/xf86libinput.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/draglock.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/bezier.h"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 182206 to 210863 (+16%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGSIZE changed from 90033 to 94161 (+5%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGV changed from 1.2.1 [default] to 1.3.0 [default]

--===============8108017743584037000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-32 sysroot...done.
Removing 88 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 294 Local 251 Mirrors 0 Missed 43 Current 193 (85% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 212 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 746 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 747 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 748 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 764 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 802 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 813 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 843 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 844 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 845 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 891 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 892 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 893 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 896 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 259 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running setscene task 268 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 922 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 923 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 925 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: Running task 926 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: Running task 927 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 928 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 929 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running task 931 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 932 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 933 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: Running task 945 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 946 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 956 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: Running task 957 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: Running task 963 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 964 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 965 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 966 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 967 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: Running task 970 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running task 971 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 998 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 999 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 76218b70f9df79b8152b46f5730858b69862a2418932ec834bebe34698bfd4d8
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: Running task 1000 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.2549822
NOTE: Running setscene task 322 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 323 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1022 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1023 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 365 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 487 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1503 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1504 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1597 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: Running task 1606 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1607 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1646 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 1647 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1654 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1656 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1657 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1658 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1659 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1660 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1661 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1662 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: Running task 1664 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1666 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1667 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1668 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1669 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1670 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1671 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1672 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1674 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1676 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1678 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1679 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: Running task 1680 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1682 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1683 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1684 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1686 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1687 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1691 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1692 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1693 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1695 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: Running task 1696 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1698 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: Running task 1699 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1700 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1701 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1702 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1703 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1704 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1705 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1706 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1707 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1708 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1709 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1710 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1711 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1712 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1713 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1714 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1716 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1718 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1719 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1720 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1721 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1722 of 1722 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1722 tasks of which 1601 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8108017743584037000==
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
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 24 Mirrors 0 Missed 43 Current 491 (35% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 502 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.2504571
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 557 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1367 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1369 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1406 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1494 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1562 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1586 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: Running task 1645 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1646 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1647 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: Running task 1712 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1713 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1714 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1715 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1727 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1764 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1768 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1798 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1826 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 1827 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: Running task 1828 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1829 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1830 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1831 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1832 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1833 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 1834 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1835 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1838 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 1841 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1842 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1864 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1872 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: Running task 1874 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1876 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: Running task 1877 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1879 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1881 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 1882 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 76218b70f9df79b8152b46f5730858b69862a2418932ec834bebe34698bfd4d8
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1890 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1898 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1899 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1903 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1904 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1906 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1908 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: Running task 1909 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1912 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1917 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1919 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1920 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1922 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1923 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1925 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1926 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1930 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1931 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1933 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1935 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1936 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: Running task 1937 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1938 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1942 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1945 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1946 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1948 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1949 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1950 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1951 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1952 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1955 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1956 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1957 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1958 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1959 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1960 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1960 tasks of which 1839 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8108017743584037000==
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
meta-yocto-bsp       = "tmp-auh-upgrades:c0741e620d652b998337a0f32e39ab4e2d6e7769"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 23 Mirrors 0 Missed 43 Current 492 (34% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 502 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.239.0-r0/temp/log.do_packagedata_setscene.2377120
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 557 of 558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1367 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1368 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1406 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_fetch)
NOTE: Running task 1494 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1562 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_write_config)
NOTE: Running task 1585 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: Running task 1644 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1647 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1648 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1699 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1700 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1701 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Started
NOTE: Running task 1702 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1727 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 1764 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1766 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: Running task 1809 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1810 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 1827 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_unpack)
NOTE: Running task 1828 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: Running task 1829 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1830 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1831 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1832 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1833 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: Running task 1834 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1835 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 1836 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: Running task 1837 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1838 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1839 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 1841 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1863 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1868 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: Running task 1870 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1871 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1872 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1873 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1874 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1876 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1877 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: Running task 1878 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1879 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1880 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1881 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1882 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 76218b70f9df79b8152b46f5730858b69862a2418932ec834bebe34698bfd4d8
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: Running task 1889 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running task 1890 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libinput-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1894 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1896 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1897 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1898 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1899 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1903 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1904 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1905 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1906 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1907 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1908 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1909 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1910 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1912 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1916 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1917 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1919 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1920 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1922 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1923 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1925 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile)
NOTE: recipe libinput-1.22.1-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1926 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1930 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1931 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1933 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install)
NOTE: recipe libinput-1.22.1-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_install: Succeeded
NOTE: Running task 1935 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_install_ptest_base)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.22.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1936 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_populate_sysroot)
NOTE: Running task 1937 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_package)
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.22.1-r0: task do_package: Started
NOTE: recipe libinput-1.22.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.22.1-r0: task do_package: Succeeded
NOTE: Running task 1938 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.22.1.bb:do_packagedata)
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.22.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1942 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1943 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1945 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1946 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1947 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1948 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1949 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1950 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1951 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1952 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1955 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1956 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1957 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1958 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1959 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1960 of 1960 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1960 tasks of which 1839 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.243.0-r0 to 0:1.3.239.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.239.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8108017743584037000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 182206 to 210863 (+16%)

--===============8108017743584037000==--

