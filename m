Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D76C2D0D0
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18381.1718475799648686807
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hM8WJqG4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qfMCQwQH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101901d23beef-75c93bcd-dc38-409a-94e3-b87db3466d19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4hqNlgHH8sw1r4PfNQIIAs8vHx0E5VC+KNmOL9cuI2w=;
	b=hM8WJqG4hj84SARvUKXr/e0u3Rc2ctY6vc0vt+zW+U9/FpA4gcNrWo7QMXHEzGtz
	fB6r3mAdNaUjQfpDzMSo63nnQvX5HVesRhJsMXWiXpYBd8XyGaVQrs0dZhq57ySa/vo
	a50V3vAksQWITbqqnCOTur5tE+ROK6k41t1mY6uw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4hqNlgHH8sw1r4PfNQIIAs8vHx0E5VC+KNmOL9cuI2w=;
	b=qfMCQwQHrUvuwbZcGKKy4+XAI8+O3NL95ObMUz0YVYQvR2QG+MoLiKOXBZ9AcERJ
	dz46zJHTxO69SOiiO7lsnaeK6r+ernNKcJiFCV3pse8aI4SqDfVY9wNvtFtQFuqzTFL
	JUJAZao903LgeaS1g79fKYSt3XHB2gxdiWYooaZw=
Content-Type: multipart/mixed; boundary="===============7563043158467812140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.24.4 SUCCEEDED
Message-ID: <010101901d23beef-75c93bcd-dc38-409a-94e3-b87db3466d19-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200750

--===============7563043158467812140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.24.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.24.3-1.24.4.patch
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

-- >8 --
From e6499af614ba4fb2b17c4c6f8f01a4802c3ea2b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 15:57:08 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.24.3 -> 1.24.4

---
 ...streamer1.0-vaapi_1.24.3.bb => gstreamer1.0-vaapi_1.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.3.bb => gstreamer1.0-vaapi_1.24.4.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
index 8ddfe15de9..b4ace68129 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "845f2efe0dca8dab234dde8fb091da2cd06a9d2a683422b56dcb688954f9070e"
+SRC_URI[sha256sum] = "2dfb322e37370b6671b62ff60dc1da81f87dac5a17c1c7ef15a783d2355900b8"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.44.0


--===============7563043158467812140==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.24.3-1.24.4.patch"

RnJvbSBlNjQ5OWFmNjE0YmE0ZmIyYjE3YzRjNmY4ZjAxYTQ4MDJjM2VhMmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTU6NTc6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yNC4zIC0+IDEuMjQuNAoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjI0LjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjQuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjI0LjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjQuNC5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjQuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yNC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yNC4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjQuNC5iYgppbmRleCA4ZGRmZTE1ZGU5Li5iNGFjZTY4MTI5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjQuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjQuNC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
Ijg0NWYyZWZlMGRjYThkYWIyMzRkZGU4ZmIwOTFkYTJjZDA2YTlkMmE2ODM0MjJiNTZkY2I2ODg5
NTRmOTA3MGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmRmYjMyMmUzNzM3MGI2NjcxYjYyZmY2
MGRjMWRhODFmODdkYWM1YTE3YzFjN2VmMTVhNzgzZDIzNTU5MDBiOCIKIAogUyA9ICIke1dPUktE
SVJ9LyR7UkVBTFBOfS0ke1BWfSIKIERFUEVORFMgPSAibGlidmEgZ3N0cmVhbWVyMS4wIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgotLSAKMi40NC4w
Cgo=

--===============7563043158467812140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1882 targets, 46 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-64 sysroot...done.
Removing 109 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8ac0ee94309ab1f874a2fce2ad180493ff20e004"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8ac0ee94309ab1f874a2fce2ad180493ff20e004"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 837 Local 817 Mirrors 0 Missed 20 Current 371 (97% match, 98% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 381 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libva-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1114 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_recipe_qa)
NOTE: Running task 1117 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_write_config)
NOTE: Running task 1126 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_write_config)
NOTE: recipe libva-2.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 526 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_write_config: Started
NOTE: recipe libva-2.20.0-r0: task do_write_config: Started
NOTE: Running setscene task 540 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 556 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1172 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_recipe_qa unihash changed to d646edc76069f8d5b562fb31bdc1f27ff26e5c07761cf36e6e097d092f26d622
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 566 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_create_spdx_setscene)
NOTE: Running task 1177 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_unpack)
NOTE: Running task 1178 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_fetch: Started
NOTE: recipe libva-2.20.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_fetch: Succeeded
NOTE: Running task 1179 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 602 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running task 1180 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.20.0-r0: task do_patch: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_unpack: Succeeded
NOTE: Running task 1181 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_patch)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 605 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.20.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_patch: Succeeded
NOTE: Running task 1183 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1184 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_populate_lic)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-bad/1.24.3/temp/log.do_packagedata_setscene.2273421
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_populate_lic: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 635 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_populate_lic unihash changed to 25747fcca10051c62e57128965e1e742c7643bdf5f8494d4a7aa9300f0a7c03d
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_deploy_source_date_epoch unihash changed to 9593906877bff990683fcbb116842078282f8a58026c5911ef1673f4a467ca54
NOTE: Running setscene task 630 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 647 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 686 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 687 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 710 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 711 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 730 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 732 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 734 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 753 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 759 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 760 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 761 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 768 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 788 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 790 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 794 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 797 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 800 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 817 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 824 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 826 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 827 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 831 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 832 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 839 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 852 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 865 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 875 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 887 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 888 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 890 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 901 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 905 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 910 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 914 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 919 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 924 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 927 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 932 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 935 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 950 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 960 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 964 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 967 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 969 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 971 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 972 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 978 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 983 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 986 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 995 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 996 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 999 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1001 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1011 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1014 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1016 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1018 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1022 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1030 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1279 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1035 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1037 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1400 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1401 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1044 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1641 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1654 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1047 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 1048 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: Running task 1656 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1657 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1055 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1070 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1072 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1073 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1075 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1079 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1080 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1084 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1085 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1087 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1089 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1093 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1099 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1101 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1111 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1118 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1120 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1122 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1123 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1124 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1131 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1132 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1133 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1135 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1144 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2115 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1154 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1156 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1158 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1159 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1166 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1171 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1174 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1176 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1182 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1183 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 2213 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1196 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1198 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash dbb172ada8a7d5c3a51dcc6e461f8b79d45d027041a03b0f8e5ebeabc003684b to wss://hashserv.yoctoproject.org/ws ({'taskhash': '8d1771b79dcfb03f9658dd28927a13a8a911450582ffe405d747465340459288', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'dbb172ada8a7d5c3a51dcc6e461f8b79d45d027041a03b0f8e5ebeabc003684b'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 8d1771b79dcfb03f9658dd28927a13a8a911450582ffe405d747465340459288 -> dbb172ada8a7d5c3a51dcc6e461f8b79d45d027041a03b0f8e5ebeabc003684b as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1201 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1203 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1206 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1208 of 1208 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2651 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3127 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3273 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 3299 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_packagedata: Started
NOTE: recipe libva-2.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3305 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_configure)
NOTE: recipe libva-2.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.20.0-r0: task do_configure: Succeeded
NOTE: Running task 3307 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_compile)
NOTE: recipe libva-2.20.0-r0: task do_compile: Started
NOTE: recipe libva-2.20.0-r0: task do_compile: Succeeded
NOTE: Running task 3308 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_install)
NOTE: recipe libva-2.20.0-r0: task do_install: Started
NOTE: recipe libva-2.20.0-r0: task do_install: Succeeded
NOTE: Running task 3309 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_package)
NOTE: Running task 3310 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.20.0-r0: task do_package: Started
NOTE: recipe libva-2.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3311 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3312 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_configure: Started
NOTE: recipe libva-2.20.0-r0: task do_package: Succeeded
NOTE: Running task 3313 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_packagedata)
NOTE: recipe libva-2.20.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.20.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_packagedata unihash changed to 92cd32328ac43dad8da20cc28eb0d7d6e1dfcc9d522be95115c46a10c1013c90
NOTE: Setscene tasks completed
NOTE: Running task 3314 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.20.0.bb:do_create_spdx)
NOTE: recipe libva-2.20.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.20.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3315 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3316 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 3317 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 3318 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_package)
NOTE: Running task 3319 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 3320 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3321 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_create_spdx)
NOTE: Running task 3322 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_package_write_ipk)
NOTE: Running task 3323 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_package_write_deb)
NOTE: Running task 3324 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_create_spdx: Started
NOTE: Running task 3325 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_package_qa unihash changed to 0bf4b7783f24b66893504b41a4c2700ff3064a883ca0913801a205abaa591bae
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3326 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.24.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3327 of 3327 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3327 tasks of which 3281 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 184 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstanalytics-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstdxva-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmse-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-analyticsoverlay went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-unixfd went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvcgadget went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-analytics-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dxva-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.24.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7563043158467812140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.4.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.24.3 [default] to 1.24.4 [default]

--===============7563043158467812140==--

