Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB18CD98D9
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1567.1780328135766696445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q+bztls2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Nhcmf/EQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3c1fb-56e198b9-aec4-4380-ba74-b6d9aa2f51b4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vIBoKa9AFuK+H3XjZja9l3fPP26ov9lDUI02cXcEJ6Y=;
	b=Q+bztls2U+ynJT0lxF6x5LD0XKi2C837Pi/leUHmmusGH8voh5Xzyju+Eqi/Potq
	mtca+Nx3Xufo1kL+erpSQ00KWX8wB6z6QTTZ/Nwi5M7iTlYjpFQaPsZlGCpyGBTVdXF
	3k/R9Mv9Lsw6fxyHcSZuV7U5EaGI4T/pCWj0nyPc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vIBoKa9AFuK+H3XjZja9l3fPP26ov9lDUI02cXcEJ6Y=;
	b=Nhcmf/EQttSLHgLr1EYxvJ6PK9L3xr9G38/2E8s7bgcu7Mhft7VwoXWo7s9TfiZy
	KMmolcq9XNJxPrKt2YKEZD6OSso5yYHOINsc8jDegt9l8YzFTuurcTzFRbcg3vEx3sS
	N06MZDnuhSkXOvZF6Uw05e1NRLwE20oaWLpTIGkQ=
Content-Type: multipart/mixed; boundary="===============2705608632797312657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-python: upgrading to 1.28.3 SUCCEEDED
Message-ID: <0101019e83d3c1fb-56e198b9-aec4-4380-ba74-b6d9aa2f51b4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237944

--===============2705608632797312657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.28.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.28.2-1.28.3.patch
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
From 3eebdb4b7ceb2d81a5f853a9e87ab261b255c926 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 12:41:50 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.28.2 -> 1.28.3

---
 ...reamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb
index 181e3d8ea4..93e21d43fd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "12fdd8e19af97d797a6b2c195228e6c9edc4cddfa68274912b78ef66068ad822"
+SRC_URI[sha256sum] = "810210f1ff6ddbd5f1d1d7585bff1fc0daa7e1d7e3b01e9e7166137341710af3"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============2705608632797312657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.28.2-1.28.3.patch"

RnJvbSAzZWViZGI0YjdjZWIyZDgxYTVmODUzYTllODdhYjI2MWIyNTVjOTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMjo0MTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguMwoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjguMi5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yOC4yLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yOC4zLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjguMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjI4LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjguMy5iYgppbmRleCAxODFlM2Q4ZWE0Li45M2UyMWQ0M2ZkIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI4LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yOC4zLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMmZkZDhlMTlhZjk3ZDc5N2E2YjJjMTk1
MjI4ZTZjOWVkYzRjZGRmYTY4Mjc0OTEyYjc4ZWY2NjA2OGFkODIyIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjgxMDIxMGYxZmY2ZGRiZDVmMWQxZDc1ODViZmYxZmMwZGFhN2UxZDdlM2IwMWU5ZTcx
NjYxMzczNDE3MTBhZjMiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgog
UkRFUEVORFM6JHtQTn0gKz0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
IHB5dGhvbjMtcHlnb2JqZWN0IgotLSAKMi40Ny4xCgo=

--===============2705608632797312657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-f32234ceea63adcb8eb4eabdd4dc7d2a8992c004"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:f32234ceea63adcb8eb4eabdd4dc7d2a8992c004"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1092 Local 1003 Mirrors 0 Missed 89 Current 516 (91% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 569 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 614 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 619 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 634 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 635 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 642 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 657 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 689 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 691 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 700 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 714 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.95.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 732 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.56.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.95.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 751 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 752 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 761 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.95.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 765 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 766 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 769 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 771 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 778 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.95.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 784 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 785 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 794 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 795 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 797 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 802 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 803 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 804 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 806 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 810 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 813 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.57.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.95.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.95.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 828 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 830 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 838 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.95.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.62.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 850 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 857 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_package_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.95.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 866 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 867 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 869 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 870 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 873 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 877 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 886 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 888 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 890 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libstd-rs-1.95.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 894 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 895 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 900 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 904 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.95.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 909 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 918 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_spdx_setscene)
NOTE: Running setscene task 920 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 923 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 924 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 931 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 932 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcxx-22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe libcxx-22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 936 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 937 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.57.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 940 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 941 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 943 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 944 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 948 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcxx-22.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 961 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 971 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 974 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_package_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 977 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 982 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 983 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 995 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 996 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe libcxx-22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 998 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1001 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1003 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1013 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1016 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1023 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1024 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1025 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1027 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_spdx_setscene)
NOTE: recipe compiler-rt-22.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1033 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcxx-22.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1053 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1055 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1064 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1068 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-22.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1071 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1077 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1078 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1082 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_recipe_spdx_setscene)
NOTE: recipe compiler-rt-22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1088 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1090 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1093 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1101 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1103 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1104 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1105 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1117 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe compiler-rt-22.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-22.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1134 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1138 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1140 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1144 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1148 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1152 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1154 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1171 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1174 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1189 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1197 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1198 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1201 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1203 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1204 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1208 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1209 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1212 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1214 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1215 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1131 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1207 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1247 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1222 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1311 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1312 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: Running task 1378 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running task 1386 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1481 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: recipe librsvg-2.62.2-r0: task do_fetch: Started
NOTE: Running task 1527 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_write_config)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1593 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: Running task 1665 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: recipe librsvg-2.62.2-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: Running task 1694 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_unpack)
NOTE: Running task 1697 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1756 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: Running task 1757 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: Running task 1758 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 1759 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: recipe librsvg-2.62.2-r0: task do_write_config: Started
NOTE: Running task 1791 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1809 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1814 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_fetch)
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe librsvg-2.62.2-r0: task do_write_config: Succeeded
NOTE: Running task 1815 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1843 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1857 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1858 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: Running task 1859 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.62.2-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 1860 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_fetch: Succeeded
NOTE: Running task 1861 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 1862 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: Running task 1863 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: Running task 1864 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.56.2-r0: task do_unpack: Started
NOTE: Running task 1865 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Started
NOTE: Running task 1866 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1867 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1868 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_patch)
NOTE: Running task 1869 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1870 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 1871 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 1873 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: Running task 1874 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: Running task 1901 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_fetch)
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: Running task 1916 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_write_config)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1932 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_write_config)
NOTE: Running task 1969 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_write_config: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1972 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2003 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_write_config)
NOTE: Running task 2013 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2078 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 2080 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_unpack: Started
NOTE: Running task 2082 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx)
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2093 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_create_recipe_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1228 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1229 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1230 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1231 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1232 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1233 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1235 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1236 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1237 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1239 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1240 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1241 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1242 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1243 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1244 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1246 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1247 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1248 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1249 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1252 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1256 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1258 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1259 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 1261 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1263 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1264 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1266 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1267 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1268 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1269 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1270 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1271 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1272 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1275 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1278 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1280 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1281 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1287 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1288 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1290 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1292 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1293 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1296 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1297 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1298 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1300 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1301 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1305 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1309 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1311 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1312 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1314 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1315 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1316 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1318 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1325 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1326 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1327 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1332 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1333 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1334 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1335 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1338 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1339 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1340 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1341 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1350 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1351 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1352 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1356 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1358 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1359 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1360 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1361 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1362 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1364 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1366 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1368 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1369 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1370 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1372 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1376 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1377 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1380 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1381 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1383 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1385 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1386 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1387 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1390 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1391 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2147 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1394 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1396 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2203 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 2292 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: Running task 2295 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2304 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1398 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: Running task 2305 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2311 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx)
NOTE: Running setscene task 1400 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1401 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1403 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1404 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: Running setscene task 1406 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1408 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_unpack: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1409 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2334 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_create_recipe_spdx)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1412 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1413 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1415 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1416 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2341 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2342 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2348 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_recipe_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1419 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1420 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1421 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1422 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1424 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1425 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1427 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 1428 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash aba8a67b17f233c3290af87ba263c6d903f9d2d6a7c38a16e1538ef1c6acf24b to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'a74802be99ad21ff623b37ab6398c01462011979ae5dd0651feb760d95fd39df', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'aba8a67b17f233c3290af87ba263c6d903f9d2d6a7c38a16e1538ef1c6acf24b'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a74802be99ad21ff623b37ab6398c01462011979ae5dd0651feb760d95fd39df -> aba8a67b17f233c3290af87ba263c6d903f9d2d6a7c38a16e1538ef1c6acf24b as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1429 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 1430 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2355 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_create_recipe_spdx)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1435 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1436 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1437 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1439 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1441 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1443 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1444 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1446 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1447 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1448 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1452 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1454 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.62.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2393 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1455 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1456 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1457 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1458 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1459 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2405 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.3.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1460 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1463 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2407 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe libxml2-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.28.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2413 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2414 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running setscene task 1465 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1466 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1468 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1469 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1470 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1471 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.62.2-r0: task do_unpack: Succeeded
NOTE: Running task 2416 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1473 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1476 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1478 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1480 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash aba8a67b17f233c3290af87ba263c6d903f9d2d6a7c38a16e1538ef1c6acf24b to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '54b852244818b3e4760658fb00bcf43b19282bd8f5142684d00b49ce7476f6d6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'aba8a67b17f233c3290af87ba263c6d903f9d2d6a7c38a16e1538ef1c6acf24b'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 54b852244818b3e4760658fb00bcf43b19282bd8f5142684d00b49ce7476f6d6 -> aba8a67b17f233c3290af87ba263c6d903f9d2d6a7c38a16e1538ef1c6acf24b as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.62.2-r0: task do_patch: Succeeded
NOTE: Running task 2436 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.62.2.bb:do_rust_gen_targets)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1483 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.62.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.62.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1485 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1486 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1487 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1488 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1489 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1490 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1491 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1492 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2442 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1494 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1496 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1498 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1499 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1500 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1501 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1502 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1503 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1504 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1505 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1506 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1507 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1508 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1509 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1510 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1511 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1512 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1513 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1514 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1516 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1519 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1520 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1523 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1531 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1534 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1536 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1538 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1539 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1541 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1543 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1547 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1548 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1549 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1552 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1556 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1557 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1558 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1560 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1562 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1563 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1564 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1567 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1569 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1571 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1573 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1574 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1576 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1577 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1578 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1581 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1583 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1584 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1585 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1586 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1588 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1592 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1593 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1594 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1599 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1602 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1603 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1605 of 1608 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3051 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3298 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3433 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3434 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3435 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3457 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3495 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_packagedata)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3644 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3655 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package_write_ipk)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3656 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package_write_deb)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_packagedata: Started
NOTE: Running task 3657 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: Running task 3658 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package_qa)
NOTE: Running task 3663 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package_write_ipk)
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3664 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package_write_deb)
NOTE: Running task 3665 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_write_ipk: Started
NOTE: Running task 3666 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: Running task 3667 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_write_deb: Started
NOTE: Running task 3668 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_qa: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_qa: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3669 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3670 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3671 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_configure: Started
NOTE: Running task 3672 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3673 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3674 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_configure: Succeeded
NOTE: Running task 3675 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3676 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.56.2-r0: task do_compile: Succeeded
NOTE: Running task 3677 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_install)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_package_qa unihash changed to 8b314da0925b3dec789ee7f4e0e276caad60304e076031381eb79352826ec53c
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package_qa unihash changed to 2511cda6a6c241a1fb907dc22500a55412a14031e3d31bd25b3e34794672f720
NOTE: recipe python3-pygobject-3.56.2-r0: task do_install: Succeeded
NOTE: Running task 3678 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_package)
NOTE: Running task 3679 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3680 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3682 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 3683 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_package: Succeeded
NOTE: Running task 3684 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3685 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: recipe python3-pygobject-3.56.2-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 3688 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: Running task 3689 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_configure: Succeeded
NOTE: Running task 3690 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_compile)
NOTE: recipe vala-0.56.19-r0: task do_compile: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 3691 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3692 of 3784 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.56.2-r0: task do_packagedata: Failed
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Failed
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3692 tasks of which 3574 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601124103.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601124103.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pygobject/3.56.2/temp/log.do_packagedata.3742134
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxkbcommon/1.13.1/temp/log.do_packagedata.3754809
Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.56.3-r0 to 0:3.56.2-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-src went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-dbg went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-staticdev went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-dev went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-doc went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-locale went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-bash-completion went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package xkbcli went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbcommon-x11 went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: QA Issue: Package version for package libxkbregistry went backwards which would break package feeds (from 0:1.13.2-r0 to 0:1.13.1-r0) [version-going-backwards]
ERROR: libxkbcommon-1.13.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pygobject/3.56.2/temp/log.do_packagedata.3742134
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb:do_packagedata) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxkbcommon/1.13.1/temp/log.do_packagedata.3754809
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata) failed with exit code '1'

--===============2705608632797312657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-python/1.28.2/plugin -> /usr/src/debug/gstreamer1.0-python/1.28.3/plugin, directory renamed /usr/src/debug/gstreamer1.0-python/1.28.2/gi/overrides -> /usr/src/debug/gstreamer1.0-python/1.28.3/gi/overrides
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.3.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PV changed from "1.28.2" to "1.28.3"

--===============2705608632797312657==--

