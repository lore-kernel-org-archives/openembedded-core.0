Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA77C87FDD
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13521.1681581684955202508
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mqqhGBqv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018786143bdd-d178d841-6a63-4bd3-b7f1-85a308a5997a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XXpd7rAnNYanuEXOWq3riF1O6y6Tw7jXhp79ilI/3cU=;
	b=mqqhGBqv3telZkVmuuJSjHDI0oYYUYXG2AGhoiRjBQDgjspcSawkFl0AkFrNXsn8
	BgVQWOEezgEqaVil9nOBxuBSQIG1St5daFqYE8kGR1viEm2OUWO4jwVMgpVGq2tEuCp
	vX850khimvSgLCq9GEG/nA/kOTp09xmaF4gjFSSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XXpd7rAnNYanuEXOWq3riF1O6y6Tw7jXhp79ilI/3cU=;
	b=DVEp4zpmIhb0ioHJkOiKiFpHOqwNozrYiqdr+Oz8QVlN7hXij41LO8MqyBE5jac1
	auh+jdY3lgrMWnA2zHF0KVNHOQ4zSD+2EOoAJZcpos+HFyPP6ezb/Lf8wtvhAZMXPh6
	aov1WBPeNRRX5etZ8nn1iSpFOdehxx0gvG+7E+oY=
Content-Type: multipart/mixed; boundary="===============7649064951995215852=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.10.1 FAILED
Message-ID: <0101018786143bdd-d178d841-6a63-4bd3-b7f1-85a308a5997a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180074

--===============7649064951995215852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.10.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.10.0-4.10.1.patch
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
--===============7649064951995215852==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.10.0-4.10.1.patch"

RnJvbSBmMDZjMzhlZDE4Y2JhNGEyN2Q5MmE5ODI1ZmM2MjFmNWRkNTFjM2M5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTM6NDY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTAuMCAtPiA0LjEwLjEKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xMC4wLmJiID0+IGd0azRfNC4xMC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTAuMC5iYiA9PiBndGs0XzQuMTAuMS5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMC5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMC4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMS5iYgppbmRleCBkNThmZTE0OWVjLi5k
Mjg2MzBhZDBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTAuMS5iYgpAQCAtMzcs
NyArMzcsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4ZGMxZTdjM2IzYTQ2NzcyZjBmYTQxNmE4Y2EzZmQyMWQwZDBiM2Iw
M2ZiMzA3ZDJlNzMyN2ViZWU2OTYyNmU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4ZmNhYzA0
YmM3NzE1YjlkYTY2N2M5MTFhNWVlOGYyNjJlMjAwZDFkNmE1MGFkZjIzNjQ1Y2E4Y2ZjZDAzMTEi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============7649064951995215852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1800 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0e4e31f909d7c174173c56a67b4900091c91294c"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 113 Local 26 Mirrors 0 Missed 87 Current 724 (23% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 735 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 837 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 837 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gtk+3/3.24.36-r0/temp/log.do_packagedata_setscene.3546746
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 836 of 837 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package_setscene)
NOTE: recipe rust-native-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1838 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1879 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1957 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2019 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 2060 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2061 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2089 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2095 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2163 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2164 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2165 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2177 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2178 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2222 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2223 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2245 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2246 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2265 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2266 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2267 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: Running task 2282 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2283 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2284 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2285 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2287 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: Running task 2337 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2345 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2346 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2347 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2348 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2349 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: Running task 2380 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2381 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2382 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2383 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2384 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 2416 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2427 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2444 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2452 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: Running task 2461 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2462 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2467 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2468 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2469 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2470 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2471 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2472 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2473 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 2541 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2542 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2559 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 2560 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2561 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2564 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: Running task 2574 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2575 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2576 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2577 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2578 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2579 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Started
NOTE: Running task 2580 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2581 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: Running task 2582 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2583 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2584 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2585 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2586 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2587 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2588 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2589 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2590 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2591 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2633 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 2641 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2648 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2713 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 2780 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2781 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2782 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2783 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2784 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2785 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2786 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2787 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2788 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: Running task 2789 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2790 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2791 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2792 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running task 2793 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2794 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: Running task 2795 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2796 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2797 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2798 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2799 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 2800 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2801 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2802 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2803 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: Running task 2804 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2805 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: Running task 2806 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2807 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2808 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2809 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: Running task 2810 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2811 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2812 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2813 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2814 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2825 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2826 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2832 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2833 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 2834 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2835 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2836 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2837 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: Running task 2838 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2839 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to ef5fedaa10b7e43e02de085e95d7e411d6115040d44ec03ca3a66e7726133d1c
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2840 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: Running task 2844 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2845 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2847 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2849 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2851 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2852 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2853 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2854 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2855 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2856 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2857 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2858 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2859 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2860 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 2861 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2862 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2863 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2864 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2865 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2866 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 2867 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2868 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2869 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2870 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2871 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2872 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2873 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2874 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: Running task 2875 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2876 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2877 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2878 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2879 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2880 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2881 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2882 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2883 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2884 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: Running task 2885 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: Running task 2886 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2887 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: Running task 2888 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2889 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2890 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2891 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2892 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2893 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2894 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2895 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2896 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2897 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2899 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2900 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: Running task 2901 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2902 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2903 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2904 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2905 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2907 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2909 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2910 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2911 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2913 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2914 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2915 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2916 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 2917 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2918 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2919 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2920 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2921 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2922 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2923 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2925 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2926 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2927 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2928 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2929 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2930 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2931 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2933 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2935 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2936 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2937 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2940 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2941 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2942 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2944 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2947 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2948 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2949 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2950 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2951 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2952 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2953 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2954 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2955 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2957 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2958 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2959 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2960 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2961 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2962 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_compile)
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2963 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2964 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_install)
NOTE: recipe gtk4-4.10.1-r0: task do_install: Started
NOTE: recipe gtk4-4.10.1-r0: task do_install: Succeeded
NOTE: Running task 2965 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package)
NOTE: Running task 2966 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_package: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package: Succeeded
NOTE: Running task 2967 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_packagedata)
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_write_rpm)
NOTE: Running task 2969 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_qa)
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2970 of 2970 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2970 tasks of which 2719 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7649064951995215852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1000.0", added "/usr/lib/.debug/libgtk-4.so.1.1000.1"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 28338696 to 28367744 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 13929559 to 13929842 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dev: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-doc: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGSIZE changed from 126085 to 126148 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 102060 to 102027 (-0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGSIZE changed from 100824 to 101153 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGSIZE changed from 97459 to 97730 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 101931 to 101986 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGSIZE changed from 101411 to 101426 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 101177 to 101193 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGSIZE changed from 62348 to 71808 (+15%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGSIZE changed from 92119 to 92854 (+1%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGSIZE changed from 101487 to 101548 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGSIZE changed from 102394 to 102455 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 128684 to 145527 (+13%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGSIZE changed from 100135 to 100145 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 102120 to 102178 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGSIZE changed from 101445 to 101507 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 97952 to 97969 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 99016 to 99027 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 121566 to 121583 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 38151478 to 38173498 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-src: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.0", added "/usr/lib/libgtk-4.so.1.1000.1"
packages/core2-32-poky-linux/gtk4/gtk4: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PKGSIZE changed from 13403247 to 13411439 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4: PV changed from "4.10.0" to "4.10.1"
packages/core2-32-poky-linux/gtk4: PKGV changed from 4.10.0 [default] to 4.10.1 [default]
packages/core2-32-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.0.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.10/gtk-4.10.1.tar.xz"
packages/core2-32-poky-linux/gtk4: PV changed from "4.10.0" to "4.10.1"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.0 to libgtk-4.so.1.1000.1
  /usr/lib/libgtk-4.so.1.1000.0 moved to /usr/lib/libgtk-4.so.1.1000.1
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-12.2.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-12.2.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/xcoffout.h was removed

--===============7649064951995215852==
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
meta-yocto-bsp       = "tmp-auh-upgrades:0e4e31f909d7c174173c56a67b4900091c91294c"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 25 Mirrors 0 Missed 87 Current 721 (22% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 733 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gtk+3/3.24.36-r0/temp/log.do_packagedata_setscene.4059878
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 832 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package_setscene)
NOTE: Running task 1832 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1861 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1939 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2001 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2042 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2043 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2071 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2077 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2102 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2103 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2111 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2112 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2149 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2154 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2155 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2222 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2223 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2224 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2230 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: Running task 2231 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2236 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2265 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2266 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2267 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2268 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2294 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2295 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2320 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2322 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2326 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2327 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running task 2362 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2363 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2364 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2365 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2366 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2392 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2427 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2428 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2429 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2435 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: Running task 2443 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2449 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2450 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Started
NOTE: Running task 2451 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2452 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2453 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2454 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2455 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: Running task 2485 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 2499 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2520 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 2526 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2527 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2528 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2536 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2537 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2538 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2539 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2540 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2541 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 2550 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2551 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2552 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2556 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2566 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 2590 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2599 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 2609 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2624 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: Running task 2633 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: Running task 2648 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2679 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2688 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2759 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: Running task 2760 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2761 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2762 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2763 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: Running task 2764 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2765 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2766 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2767 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2768 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2769 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2770 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2771 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: Running task 2772 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2773 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2774 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 2775 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2776 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2777 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2778 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 2779 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2780 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2781 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: Running task 2782 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2783 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2784 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2785 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2786 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2787 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2788 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: Running task 2789 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2790 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2791 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2792 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2793 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2794 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 2795 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2796 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2807 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2813 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2814 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2815 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2816 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2817 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 2818 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2819 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to ef5fedaa10b7e43e02de085e95d7e411d6115040d44ec03ca3a66e7726133d1c
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2820 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2821 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2822 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2827 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2828 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2829 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2830 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2831 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2832 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2833 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2834 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2835 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2836 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2837 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2838 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2839 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2840 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2841 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2842 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2843 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2844 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2845 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2847 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2848 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2849 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2850 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 2851 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2852 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2853 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2854 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2855 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: Running task 2856 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2857 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2858 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2859 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2860 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2861 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2862 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2863 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2864 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2865 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: Running task 2866 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2867 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2868 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2869 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2870 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2871 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2872 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2874 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2875 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2876 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2877 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2878 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2879 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2880 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2881 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2882 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2883 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2884 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2885 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2886 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2887 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2888 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2889 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: Running task 2890 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2891 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2892 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2893 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2894 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2896 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2897 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2898 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2899 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 2900 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: Running task 2901 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2902 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2903 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2904 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2905 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2906 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2907 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2909 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2911 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2912 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2913 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2914 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2915 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2916 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2917 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2918 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2919 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2921 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2922 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2923 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2924 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2926 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2927 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2928 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2929 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2930 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2931 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2933 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2934 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2935 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2936 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2937 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2940 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2941 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2942 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2944 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_compile)
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2945 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_install)
NOTE: recipe gtk4-4.10.1-r0: task do_install: Started
NOTE: recipe gtk4-4.10.1-r0: task do_install: Succeeded
NOTE: Running task 2947 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package)
NOTE: Running task 2948 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_package: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package: Succeeded
NOTE: Running task 2949 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_packagedata)
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_write_rpm)
NOTE: Running task 2951 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_qa)
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2952 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2952 tasks of which 2701 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7649064951995215852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGSIZE changed from 62348 to 71808 (+15%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 128684 to 145527 (+13%)
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1000.0", added "/usr/lib/libgtk-4.so.1.1000.1"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1000.0 to libgtk-4.so.1.1000.1
  /usr/lib/libgtk-4.so.1.1000.0 moved to /usr/lib/libgtk-4.so.1.1000.1
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-12.2.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/12.2.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/12.2.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-12.2.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.2.0/plugin/include/xcoffout.h was removed

--===============7649064951995215852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 122 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0e4e31f909d7c174173c56a67b4900091c91294c"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 520 Local 429 Mirrors 0 Missed 91 Current 310 (82% match, 89% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 1 stale sstate objects for arch qemux86...done.
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 429 of 830 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-native-2.54.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-native-2.54.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running task 943 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 961 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 989 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: Running task 1041 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1065 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1066 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 1071 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running setscene task 462 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running task 1076 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libstd-rs-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 830 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1105 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1106 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 1164 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1165 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1180 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 1181 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 1182 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1183 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1218 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 1231 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1236 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1237 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1238 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 1239 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 1240 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 1268 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1269 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: Running task 1282 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 1283 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1338 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 1339 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 1348 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: Running setscene task 472 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1362 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1381 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1382 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 1393 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1398 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 1430 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1482 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1488 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1489 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 1490 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1491 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 1496 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 1497 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1498 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 1499 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1500 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: Running task 1501 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: Running task 1502 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running setscene task 485 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: Running task 1510 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: Running task 1512 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1517 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1523 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe cargo-native-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 1524 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running setscene task 491 of 830 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1531 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 1532 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 1533 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1534 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1535 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 1536 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1537 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1538 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: Running task 1539 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 1540 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 1541 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: Running task 1546 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: Running task 1552 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: Running task 1553 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1554 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-native-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 1555 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1556 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 1558 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1559 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1560 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1561 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1562 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1563 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1564 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1565 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: Running task 1566 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1567 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1570 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 1595 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 494 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1624 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 540 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1642 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1650 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1651 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 563 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 565 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to ef5fedaa10b7e43e02de085e95d7e411d6115040d44ec03ca3a66e7726133d1c
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 568 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1669 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1670 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running setscene task 582 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 615 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 622 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 633 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 744 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 750 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2494 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2557 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2597 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2612 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2624 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2665 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2674 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2675 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2696 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2697 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2698 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2699 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2748 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2751 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2785 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2786 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2787 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2788 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2789 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 2790 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2791 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: Running task 2792 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2793 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 2794 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: Running task 2795 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2796 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2797 of 2934 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2797 tasks of which 2676 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: adwaita-icon-theme-43-r0 do_prepare_recipe_sysroot: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/staging.bbclass', lineno: 618, function: extend_recipe_sysroot
     0614:                    if "/bin/" in l or "/sbin/" in l:
     0615:                        # defer /*bin/* files until last in case they need libs
     0616:                        binfiles[l] = (targetdir, dest)
     0617:                    else:
 *** 0618:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0619:
     0620:    # Handle deferred binfiles
     0621:    for l in binfiles:
     0622:        (targetdir, dest) = binfiles[l]
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes-global/staging.bbclass', lineno: 156, function: staging_copyfile
     0152:    if os.path.islink(c):
     0153:        linkto = os.readlink(c)
     0154:        if os.path.lexists(dest):
     0155:            if not os.path.islink(dest):
 *** 0156:                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
     0157:            if os.readlink(dest) == linkto:
     0158:                return dest
     0159:            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
     0160:        os.symlink(linkto, dest)
Exception: FileExistsError: [Errno 17] Link /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/recipe-sysroot/usr/include/c++/12.2.0/i686-poky-linux already exists as a file: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/recipe-sysroot/usr/include/c++/12.2.0/i686-poky-linux'

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/43-r0/temp/log.do_prepare_recipe_sysroot.56504
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot) failed with exit code '1'

--===============7649064951995215852==
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
meta-yocto-bsp       = "tmp-auh-upgrades:0e4e31f909d7c174173c56a67b4900091c91294c"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 112 Local 25 Mirrors 0 Missed 87 Current 721 (22% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 733 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata_setscene: Started
NOTE: Running task 1832 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1861 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1940 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2001 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2042 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2043 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: Running task 2071 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2077 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2144 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_fetch)
NOTE: Running task 2145 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2186 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2187 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2203 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2204 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2222 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2223 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2226 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2228 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gtk+3/3.24.36-r0/temp/log.do_packagedata_setscene.3718388
NOTE: Running task 2261 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2262 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2263 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2264 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 832 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: Running task 2268 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.33-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
NOTE: Running task 2269 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: Running task 2270 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2271 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2272 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2273 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2274 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_unpack)
NOTE: Running task 2275 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2276 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2277 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2292 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2327 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_write_config)
NOTE: Running task 2328 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 2364 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2365 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2366 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2367 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2371 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2372 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2373 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2374 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2375 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: Running task 2431 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe orc-0.4.33-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2441 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: Running task 2454 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2455 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2456 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2457 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2484 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_write_config: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: Running task 2526 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: Running task 2527 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2609 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2675 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2676 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_unpack: Succeeded
NOTE: Running task 2677 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 2693 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_patch)
NOTE: Running task 2694 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2695 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2696 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2697 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2698 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2699 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2700 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2701 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2702 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2703 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2707 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2708 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2735 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 2754 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 2758 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2759 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2760 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2761 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 2762 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2763 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2764 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2765 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2766 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2767 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2768 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2769 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2770 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2771 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2772 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_patch: Succeeded
NOTE: Running task 2773 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2774 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2775 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2776 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2777 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2778 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2779 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: Running task 2780 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2781 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2782 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: Running task 2783 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: Running task 2784 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2785 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: Running task 2786 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2787 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2788 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: Running task 2789 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2790 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2791 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2792 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2793 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2794 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2795 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2796 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2797 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2808 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2814 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: Running task 2815 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 2816 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2817 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2818 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2819 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to ef5fedaa10b7e43e02de085e95d7e411d6115040d44ec03ca3a66e7726133d1c
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2820 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2821 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe orc-0.4.33-r0: task do_configure: Succeeded
NOTE: Running task 2822 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2827 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2828 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2829 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2830 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe orc-0.4.33-r0: task do_compile: Succeeded
NOTE: Running task 2831 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2832 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe orc-0.4.33-r0: task do_install: Succeeded
NOTE: Running task 2833 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot)
NOTE: Running task 2834 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.33-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2835 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2836 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2837 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2838 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_package: Succeeded
NOTE: Running task 2839 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata)
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2840 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2841 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2842 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2843 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2844 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: Running task 2845 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2847 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2848 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2849 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2850 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2851 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2852 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: Running task 2853 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2854 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2855 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2856 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2857 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2858 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2859 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2860 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2861 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2862 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2863 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2864 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: Running task 2865 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: Running task 2866 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2867 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2868 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2869 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2870 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2871 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2872 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2873 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2874 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2875 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2876 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2877 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2878 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2879 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2881 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2882 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2883 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2884 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2885 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2886 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2887 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2888 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2889 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2890 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2891 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2892 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2893 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 2894 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2895 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2896 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2897 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2898 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 2899 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2900 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2901 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2902 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2903 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2904 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2905 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2906 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2907 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2908 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2909 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2911 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2912 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2913 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2914 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2915 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2916 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2917 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2918 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2919 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2921 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2922 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2923 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2924 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2925 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2926 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2927 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2928 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2929 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2930 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2931 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2933 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2934 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2935 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2936 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2937 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2940 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2941 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2942 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2944 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_compile)
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2945 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2946 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_install)
NOTE: recipe gtk4-4.10.1-r0: task do_install: Started
NOTE: recipe gtk4-4.10.1-r0: task do_install: Succeeded
NOTE: Running task 2947 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package)
NOTE: Running task 2948 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_package: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package: Succeeded
NOTE: Running task 2949 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_packagedata)
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_write_rpm)
NOTE: Running task 2951 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_qa)
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2952 of 2952 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2952 tasks of which 2701 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7649064951995215852==
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
meta-yocto-bsp       = "tmp-auh-upgrades:0e4e31f909d7c174173c56a67b4900091c91294c"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 25 Mirrors 0 Missed 83 Current 715 (23% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 727 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.13.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata_setscene: Started
NOTE: Running task 1820 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_fetch)
NOTE: Running task 1849 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1926 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1989 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_write_config)
NOTE: Running task 2030 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2031 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_fetch)
NOTE: recipe iso-codes-4.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2059 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_fetch)
NOTE: Running task 2065 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2132 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2133 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2134 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2155 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_unpack)
NOTE: Running task 2156 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2183 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2184 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2213 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2214 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2215 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_unpack)
NOTE: Running task 2216 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2217 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2248 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_fetch)
NOTE: Running task 2249 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2250 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2251 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2257 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2308 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_unpack)
NOTE: Running task 2309 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2310 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gtk+3/3.24.36-r0/temp/log.do_packagedata_setscene.3889713
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 822 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Started
NOTE: Running task 2313 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2314 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2316 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_patch)
NOTE: Running task 2317 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_patch)
NOTE: Running task 2318 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2319 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2320 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2347 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_unpack)
NOTE: Running task 2348 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2349 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2350 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2354 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_fetch)
NOTE: Running task 2355 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2356 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_fetch)
NOTE: Running task 2357 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2358 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2417 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_fetch)
NOTE: Running task 2430 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_write_config)
NOTE: Running task 2431 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2432 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2433 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Started
NOTE: Running task 2501 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 2502 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 2541 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2543 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2544 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 2545 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2546 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2547 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2548 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2549 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_unpack)
NOTE: Running task 2550 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2551 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 2552 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2553 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2569 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2595 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 2599 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_write_config)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2616 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Started
NOTE: Running task 2629 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2670 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_unpack)
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2671 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Started
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 2734 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2735 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2736 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2737 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 2738 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2739 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_patch)
NOTE: Running task 2740 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2741 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_write_config: Succeeded
NOTE: Running task 2742 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2743 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2744 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2745 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2746 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2747 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2748 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 2749 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2750 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2751 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2752 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2753 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2754 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 2755 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 2756 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Started
NOTE: Running task 2757 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 2758 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_patch)
NOTE: Running task 2759 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2760 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2761 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_patch: Succeeded
NOTE: Running task 2762 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2763 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 2764 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 2765 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 2766 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_patch)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2777 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 2783 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_create_wrappers)
NOTE: Running task 2784 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2785 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_rust_gen_targets)
NOTE: Running task 2786 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.54.5-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_patch: Succeeded
NOTE: Running task 2787 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2788 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic)
NOTE: recipe librsvg-2.54.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2789 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_lic unihash changed to ef5fedaa10b7e43e02de085e95d7e411d6115040d44ec03ca3a66e7726133d1c
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 2790 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 2791 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: Running task 2792 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.36-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2796 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 2797 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2798 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2799 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2800 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2801 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2802 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2803 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2804 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2805 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2806 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 2807 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2808 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2809 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2810 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe alsa-lib-1.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2811 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2812 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2813 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2814 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 2815 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2816 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2817 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: Running task 2818 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2819 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2820 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2821 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 2822 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2823 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2824 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2825 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2827 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2828 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2829 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2830 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2831 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2832 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2833 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2834 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2835 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 2836 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2837 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2838 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_configure: Succeeded
NOTE: Running task 2839 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_compile)
NOTE: Running task 2840 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2841 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2842 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2843 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: Running task 2844 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2845 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2846 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2847 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_install_ptest_base)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2848 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2849 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2850 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_install)
NOTE: recipe tiff-4.5.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 2851 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2852 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2853 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2854 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_install)
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 2855 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 2856 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 2857 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 2858 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_install: Succeeded
NOTE: Running task 2859 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot)
NOTE: Running task 2860 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_package)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 2861 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 2862 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe tiff-4.5.0-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 2863 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_populate_sysroot)
NOTE: Running task 2864 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2865 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 2866 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2867 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 2868 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_package: Succeeded
NOTE: Running task 2869 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2870 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata: Succeeded
NOTE: recipe tiff-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 2871 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2872 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata)
NOTE: recipe tiff-4.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2873 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2874 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2875 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2876 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2877 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2878 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2879 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2880 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2881 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2882 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2883 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2884 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2885 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2886 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2887 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2888 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2889 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2890 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2891 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2892 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2893 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2894 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2895 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_compile: Succeeded
NOTE: Running task 2896 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_install)
NOTE: recipe librsvg-2.54.5-r0: task do_install: Started
NOTE: recipe librsvg-2.54.5-r0: task do_install: Succeeded
NOTE: Running task 2897 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot)
NOTE: Running task 2898 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_package)
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2899 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2900 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.5-r0: task do_package: Succeeded
NOTE: Running task 2901 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2903 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2904 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2905 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2906 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2907 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_configure)
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.10.1-r0: task do_configure: Succeeded
NOTE: Running task 2908 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_compile)
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_package: Succeeded
NOTE: Running task 2909 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_install)
NOTE: recipe gtk4-4.10.1-r0: task do_install: Started
NOTE: recipe gtk4-4.10.1-r0: task do_install: Succeeded
NOTE: Running task 2911 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package)
NOTE: Running task 2912 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.10.1-r0: task do_package: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package: Succeeded
NOTE: Running task 2913 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_packagedata)
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2914 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_write_rpm)
NOTE: Running task 2915 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_package_qa)
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.10.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.10.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2916 of 2916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.10.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2916 tasks of which 2677 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 140 ERROR messages, returning a non-zero exit code.
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-src went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dbg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-demo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-staticdev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-dev went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-doc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3 went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ab went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-af went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-am went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-an went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ang went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ar went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-as went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ast went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-az-ir went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-be+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bn-in went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-bs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ca+valencia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ckb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-crh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cs went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-cy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-da went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-de went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-dz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-el went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en+shaw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-ca went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-en-gb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eo went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-es went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-eu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-fur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ga went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gd went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-gu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-he went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hu went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-hy went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ia went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-id went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ie went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-io went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-is went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-it went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ja went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ka went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-km went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-kn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ko went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ku went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ky went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-li went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-lv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ml went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-mr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ms went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-my went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nb went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nds went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ne went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-nso went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-oc went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-or went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ps went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-pt-br went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ro went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ru went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-rw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-si went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sl went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sq went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+ije went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sr+latin went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-sv went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ta went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-te went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tg went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-th went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-tt went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ug went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-ur went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-uz+cyrillic went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-vi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-wa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-xh went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-yi went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-cn went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-hk went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk+3-locale-zh-tw went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-am-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cedilla went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-cyrillic-translit went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-inuktitut went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ipa went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-multipress went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-thai went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-er went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-ti-et went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-viqr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-wayland went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-immodule-xim went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-file went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: QA Issue: Package version for package gtk3-printbackend-lpr went backwards which would break package feeds (from 0:3.24.37-r0 to 0:3.24.36-r0) [version-going-backwards]
ERROR: gtk+3-3.24.36-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7649064951995215852==--

