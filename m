Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BEDC3065C
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.42229.1717263219612184703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=isE9wGba;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=grI9LGuV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018fd4dd3950-df4fd6bb-eba8-4352-a6cf-d2272597af0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QhYCu0x0h/aeLcpCa+C/SZdg5XM2ykYoj6zQBeR1PAM=;
	b=isE9wGba2a73eGqrc6rgvcbRvFIPiC/ca716EtABQtLOCKySTS59fhrxcuXzN+EJ
	GLlOYDtuKNERyeM4/gN69WkWGfk/q/JdfHR3SZBYjln0aTu3yMDRp8iWmcJ24qAGbsv
	eeCwG9JU0Gytj5Kg358QrfpnRmOvT7MIERQsVZyM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QhYCu0x0h/aeLcpCa+C/SZdg5XM2ykYoj6zQBeR1PAM=;
	b=grI9LGuVMdH6L3XvLtTzfWM+zAltvj/LNdq8dv3imYl+Gq6dDEKINS8J6eEoX7Aw
	Oz517L7YKRGg7/So+Kjdq1rBuaEc4Iaei0twKsByo+C+pL+ZMz6Oqd1gSBFLcvC024i
	Je9VfbOlPuQxGXQfYCOSgCbeug/jQdmp3WVy2XnE=
Content-Type: multipart/mixed; boundary="===============3221764305179040740=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.24.4 SUCCEEDED
Message-ID: <0101018fd4dd3950-df4fd6bb-eba8-4352-a6cf-d2272597af0a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200185

--===============3221764305179040740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.24.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.24.3-1.24.4.patch
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
From 54480790050df8e07f249a9977d94d97a6f2d3fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 14:59:40 +0000
Subject: [PATCH] gstreamer1.0-plugins-good: upgrade 1.24.3 -> 1.24.4

---
 ...ugins-good_1.24.3.bb => gstreamer1.0-plugins-good_1.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.3.bb => gstreamer1.0-plugins-good_1.24.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
index 41a93e85a4..48d5f9ce86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "150f914e61dc05600b68b88ca103c7cc227130158e389ea9ea159f4050a2ebb0"
+SRC_URI[sha256sum] = "023096d661cf58cde3e0dcdbf56897bf588830232358c305f3e15fd63e116626"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.44.0


--===============3221764305179040740==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.24.3-1.24.4.patch"

RnJvbSA1NDQ4MDc5MDA1MGRmOGUwN2YyNDlhOTk3N2Q5NGQ5N2E2ZjJkM2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNDo1OTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Q6IHVwZ3JhZGUgMS4yNC4zIC0+IDEuMjQuNAoKLS0tCiAu
Li51Z2lucy1nb29kXzEuMjQuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQu
NC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWdvb2RfMS4yNC4zLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4y
NC40LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuMy5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29k
XzEuMjQuNC5iYgppbmRleCA0MWE5M2U4NWE0Li40OGQ1ZjljZTg2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8x
LjI0LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWdvb2RfMS4yNC40LmJiCkBAIC02LDcgKzYsNyBAQCBCVUdUUkFDS0VSID0g
Imh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXBsdWdpbnMtZ29v
ZC8tL2lzc3VlcwogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9y
Zy9zcmMvZ3N0LXBsdWdpbnMtZ29vZC9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9LnRhci54eiIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjE1MGY5MTRlNjFkYzA1NjAwYjY4Yjg4Y2ExMDNjN2NjMjI3
MTMwMTU4ZTM4OWVhOWVhMTU5ZjQwNTBhMmViYjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDIz
MDk2ZDY2MWNmNThjZGUzZTBkY2RiZjU2ODk3YmY1ODg4MzAyMzIzNThjMzA1ZjNlMTVmZDYzZTEx
NjYyNiIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0iCiAKLS0gCjIu
NDQuMAoK

--===============3221764305179040740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-64 sysroot...done.
Removing 119 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-6be7ae1a0912b63a4c27887e84ec341073187f81"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6be7ae1a0912b63a4c27887e84ec341073187f81"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 860 Local 824 Mirrors 0 Missed 36 Current 347 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 356 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 388 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 391 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.72-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 423 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_packagedata_setscene)
NOTE: recipe mpg123-1.32.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 431 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata_setscene)
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata_setscene)
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 436 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 438 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 441 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 452 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 464 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 479 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 480 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.65-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 483 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 491 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 493 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.65-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ell-0.65-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 502 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gstreamer1.0-plugins-base/1.24.3/temp/log.do_packagedata_setscene.2797804
NOTE: Running setscene task 506 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.7-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 512 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 514 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe ell-0.65-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_package_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 533 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 551 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 555 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 557 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 560 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 578 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 579 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 595 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_package_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 725 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 778 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 762 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 773 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 774 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 777 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 986 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 990 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_fetch)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.65-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.65-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running task 1042 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1046 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1068 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1077 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1143 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1213 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_fetch)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1224 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe ofono-2.7-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.65-r0: task do_unpack: Started
NOTE: Running setscene task 795 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1239 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_recipe_qa)
NOTE: recipe ofono-2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1248 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 1257 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_unpack)
NOTE: Running task 1260 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_write_config)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running setscene task 797 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1296 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_fetch: Started
NOTE: Running task 1297 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1298 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1299 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe ell-0.65-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.7-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1300 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_write_config: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe ell-0.65-r0: task do_patch: Started
NOTE: Running task 1317 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 800 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.65-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_unpack: Succeeded
NOTE: Running task 1320 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 1321 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1322 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_fetch)
NOTE: Running task 1323 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_patch)
NOTE: recipe ofono-2.7-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 804 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running task 1324 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe ofono-2.7-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_fetch: Succeeded
NOTE: Running task 1326 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_unpack: Succeeded
NOTE: Running task 1337 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_patch: Succeeded
NOTE: Running task 1338 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1339 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_populate_lic: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_populate_lic unihash changed to 2b95a4f9f19723d15c78040b6d4ebe619f2837f11869ebbf1ad9eb298ee80be0
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 810 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 821 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 823 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 836 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 878 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 882 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 883 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 887 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 890 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 895 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 896 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 898 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 899 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 902 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 905 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 910 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 911 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 913 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 919 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 923 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 940 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 943 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 946 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 947 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 951 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 953 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 957 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 960 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 965 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 967 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 969 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 980 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 983 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 992 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 994 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 995 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 997 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1002 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1004 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1019 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1020 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1021 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1030 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1033 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1039 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1041 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1046 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1047 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1049 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1057 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1060 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1062 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1063 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1065 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1068 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1069 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1084 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1086 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1087 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1091 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1093 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1096 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1099 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1103 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1104 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1110 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1111 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1117 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1120 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1122 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1124 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1127 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1128 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1130 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1132 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1144 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1147 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1914 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1158 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1167 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1168 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1171 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1176 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1178 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1180 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1181 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1182 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1184 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1186 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1194 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1196 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1197 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2127 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Running task 2146 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1202 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1203 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1205 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1207 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2477 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3084 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 3217 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3218 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3224 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_collect_spdx_deps)
NOTE: Running task 3225 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.65-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.65-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.65-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ell-0.65-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3226 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.3-r0: task do_packagedata: Succeeded
NOTE: recipe ell-0.65-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3228 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe ell-0.65-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_compile)
NOTE: recipe ell-0.65-r0: task do_compile: Started
NOTE: recipe ell-0.65-r0: task do_compile: Succeeded
NOTE: Running task 3230 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_install)
NOTE: recipe ell-0.65-r0: task do_install: Started
NOTE: recipe ell-0.65-r0: task do_install: Succeeded
NOTE: Running task 3231 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_populate_sysroot)
NOTE: Running task 3232 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_package)
NOTE: recipe ell-0.65-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.65-r0: task do_package: Started
NOTE: recipe ell-0.65-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3233 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3234 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_configure)
NOTE: recipe ofono-2.7-r0: task do_configure: Started
NOTE: recipe ell-0.65-r0: task do_package: Succeeded
NOTE: Running task 3235 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_packagedata)
NOTE: recipe ell-0.65-r0: task do_packagedata: Started
NOTE: recipe ell-0.65-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_packagedata unihash changed to fd78280945e65f81d225f3b29f49408038ae4d03713de007f542409f897a092a
NOTE: Setscene tasks completed
NOTE: Running task 3236 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.65.bb:do_create_spdx)
NOTE: recipe ell-0.65-r0: task do_create_spdx: Started
NOTE: recipe ell-0.65-r0: task do_create_spdx: Succeeded
NOTE: Running task 3237 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3238 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe ofono-2.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3239 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_compile)
NOTE: recipe ofono-2.7-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3240 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe ofono-2.7-r0: task do_compile: Succeeded
NOTE: Running task 3241 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_install)
NOTE: recipe ofono-2.7-r0: task do_install: Started
NOTE: recipe ofono-2.7-r0: task do_install: Succeeded
NOTE: Running task 3242 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_populate_sysroot)
NOTE: Running task 3243 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_package)
NOTE: recipe ofono-2.7-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.7-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3244 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3245 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe ofono-2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3246 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3247 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3248 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe ofono-2.7-r0: task do_package: Succeeded
NOTE: Running task 3249 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_packagedata)
NOTE: recipe ofono-2.7-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata unihash changed to 76b41bec692bae300b7d9017d69509c6f3fd656175ea472222250c13c2899893
NOTE: recipe ofono-2.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_packagedata unihash changed to 430093285952675db22f97a47fec0e518f5f798a2d712a28af665177a86c84a1
NOTE: Setscene tasks completed
NOTE: Running task 3250 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx)
NOTE: Running task 3251 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.7.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.7-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.7-r0: task do_create_spdx: Succeeded
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3252 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3253 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_compile)
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Succeeded
NOTE: Running task 3254 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_install: Succeeded
NOTE: Running task 3255 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot)
NOTE: Running task 3256 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package)
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3257 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.32.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.32.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3258 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_configure)
NOTE: recipe mpg123-1.32.6-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Succeeded
NOTE: Running task 3259 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata)
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata unihash changed to 9b9ae954e56e2fdb9c48dec8389083f4f6a3c37559a41c0461e4f74044c4b89d
NOTE: Setscene tasks completed
NOTE: Running task 3260 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_create_spdx)
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Started
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3261 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_compile)
NOTE: Running task 3262 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.32.6-r0: task do_compile: Started
NOTE: recipe mpg123-1.32.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.32.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_compile: Succeeded
NOTE: Running task 3263 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_install)
NOTE: recipe mpg123-1.32.6-r0: task do_install: Started
NOTE: recipe mpg123-1.32.6-r0: task do_install: Succeeded
NOTE: Running task 3264 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_package)
NOTE: Running task 3265 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.32.6-r0: task do_package: Started
NOTE: recipe mpg123-1.32.6-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.32.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3266 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3267 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.6-r0: task do_package: Succeeded
NOTE: Running task 3268 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_packagedata)
NOTE: recipe mpg123-1.32.6-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.32.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_packagedata unihash changed to 52735dea4ede0bcf2abd58af27dfb19e7f622cb26ec69fa8f56a405ecff0dc93
NOTE: Setscene tasks completed
NOTE: Running task 3269 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_create_spdx)
NOTE: recipe mpg123-1.32.6-r0: task do_create_spdx: Started
NOTE: recipe mpg123-1.32.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3270 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3271 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 3272 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 3273 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_package)
NOTE: Running task 3274 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 3275 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3276 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_create_spdx)
NOTE: Running task 3277 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_package_write_ipk)
NOTE: Running task 3278 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_package_write_deb)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_create_spdx: Started
NOTE: Running task 3279 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_package_write_rpm)
NOTE: Running task 3280 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3281 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3282 of 3282 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3282 tasks of which 3186 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 106 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.24.4-r0 to 0:1.24.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.24.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3221764305179040740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 21677568 to 21677592 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 13315303 to 13315364 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.4.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.24.3" to "1.24.4"

--===============3221764305179040740==--

