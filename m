Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96501D47CB8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1444.1768526752375640149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=2Yg/4jSR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TFMR8/vQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468b7de-7c9c4c1a-03a2-4274-b4f9-1fb50c16c32b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526756;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cO4vRlxc+YXdXHrTjoxl78jDqze1puoPYJ1/jh9MZsM=;
	b=2Yg/4jSRGAwluBjF+vha9GogLDir5Kn4w9V+Xv5qhko2N7sD96StpZuR1InVTwnO
	OG/HpNz7k77motNA+B++TMxi2+1jYAQUW6a8eb2GqQewwa0zFuIi7+7MQPz0Yb6bvlt
	mGxiQo9SJYbG6EmTbrDeMchNiCktlXcdTUeL8AXo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526756;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cO4vRlxc+YXdXHrTjoxl78jDqze1puoPYJ1/jh9MZsM=;
	b=TFMR8/vQddGoSW6QcMleIn4IqnAHU/wjs2naYCSb6WoQbJqgGT2uctiSG37mXSlj
	2FwAg1IfuLmlI1wYPnxYfmWBNdFtTRIZ40pENLE1H7Vt8+uhWgMjQP2SjGmbGH3+Ndc
	ojOHl0zURP0PzShPRiS/MyVlXtM+siCYnHLLJE08=
Content-Type: multipart/mixed; boundary="===============5066860962889265325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.15.2 SUCCEEDED
Message-ID: <0101019bc468b7de-7c9c4c1a-03a2-4274-b4f9-1fb50c16c32b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229502

--===============5066860962889265325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *alsa-utils* to *1.2.15.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.15.1-1.2.15.2.patch
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
From fa291f2ac98475996da20633b6050ae96e8fa8dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:22:37 +0000
Subject: [PATCH] alsa-utils: upgrade 1.2.15.1 -> 1.2.15.2

---
 .../alsa/{alsa-utils_1.2.15.1.bb => alsa-utils_1.2.15.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.15.1.bb => alsa-utils_1.2.15.2.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
index 927f94afb6..ef3efdc830 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
@@ -13,7 +13,7 @@ DEPENDS = "alsa-lib ncurses libsamplerate0 bash"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327"
+SRC_URI[sha256sum] = "7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a"
 
 inherit autotools gettext pkgconfig manpages
 
-- 
2.47.1


--===============5066860962889265325==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.15.1-1.2.15.2.patch"

RnJvbSBmYTI5MWYyYWM5ODQ3NTk5NmRhMjA2MzNiNjA1MGFlOTZlOGZhOGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MjI6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLXV0aWxzOiB1cGdyYWRlIDEuMi4xNS4xIC0+IDEuMi4xNS4yCgotLS0KIC4uLi9hbHNhL3th
bHNhLXV0aWxzXzEuMi4xNS4xLmJiID0+IGFsc2EtdXRpbHNfMS4yLjE1LjIuYmJ9ICAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Eve2Fsc2EtdXRpbHNfMS4yLjE1LjEuYmIgPT4g
YWxzYS11dGlsc18xLjIuMTUuMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1LjEuYmIgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjE1LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4x
NS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNf
MS4yLjE1LjIuYmIKaW5kZXggOTI3Zjk0YWZiNi4uZWYzZWZkYzgzMCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNS4xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTUuMi5iYgpAQCAtMTMs
NyArMTMsNyBAQCBERVBFTkRTID0gImFsc2EtbGliIG5jdXJzZXMgbGlic2FtcGxlcmF0ZTAgYmFz
aCIKIAogIyBhbHNhLXV0aWxzIHNwZWNpZmllZCBpbiBTUkNfVVJJIGR1ZSB0byBhbHNhLXV0aWxz
LXNjcmlwdHMgcmVjaXBlCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcv
ZmlsZXMvcHViL3V0aWxzL2Fsc2EtdXRpbHMtJHtQVn0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI1YWQ3OWYzNDllNTljMzBjOWE0OTI5YWQ0OTk1ZWJlZTMzMjY3NDczZTBlNjMyZDdj
MWEzMGUyYjA5M2QzMzI3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhYWFhZmJmYjAxOTQyMTEz
ZWMwYzMxZTUxZjcwNTkxMGU4MTA3OTIwNTA4OGNhMmY4ZjEzN2EzODY5ZTFhM2EiCiAKIGluaGVy
aXQgYXV0b3Rvb2xzIGdldHRleHQgcGtnY29uZmlnIG1hbnBhZ2VzCiAKLS0gCjIuNDcuMQoK

--===============5066860962889265325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1956 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-5d3ae64c81f59192056bce2cd14faca73593556c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:5d3ae64c81f59192056bce2cd14faca73593556c"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 248 Local 236 Mirrors 0 Missed 12 Current 254 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 303 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 331 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 347 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 973 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 363 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 364 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 379 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 383 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 977 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running task 981 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/alsa-lib/1.2.15.1/temp/log.do_packagedata_setscene.2784257
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 391 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_package_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 401 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 407 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 993 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 418 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 422 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 434 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 435 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_package_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 436 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 437 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1040 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 448 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 450 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 452 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1076 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_patch)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_package_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 484 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1328 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_packagedata)
NOTE: Running task 1333 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1399 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_configure)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1405 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_collect_spdx_deps)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsamplerate0-0.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1406 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_compile)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_compile: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1407 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_install)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_install: Succeeded
NOTE: Running task 1408 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_package)
NOTE: Running task 1410 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1411 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_configure)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_package unihash changed to 4dd7c73a77196786681dfd658a316af204b62e1b788b05f09bfe84ebb7866e67
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_create_spdx became valid
NOTE: Running setscene task 500 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 502 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.2.2.bb:do_packagedata_setscene)
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsamplerate0-0.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1414 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_collect_spdx_deps)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1415 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_compile)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_install)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_install: Succeeded
NOTE: Running task 1417 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_package)
NOTE: Running task 1418 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_populate_sysroot)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package: Succeeded
NOTE: Running task 1419 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1420 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_create_spdx)
NOTE: Running task 1421 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_package_write_ipk)
NOTE: Running task 1422 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_package_write_deb)
NOTE: Running task 1423 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_package_write_rpm)
NOTE: Running task 1424 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_package_qa)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_create_spdx: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_write_ipk: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_write_deb: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_qa: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1425 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_create_package_spdx)
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_create_package_spdx: Started
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe alsa-utils-1.2.15.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_package_qa unihash changed to 0d243187302c5ef92ee7c38ec53e5c97c11ce1bcf5c1852522eaf8d986a54583
NOTE: Running noexec task 1426 of 1426 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1426 tasks of which 1398 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-src went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dbg went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-server went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-conf went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package libatopology went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-staticdev went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-dev went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-doc went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib-locale went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: QA Issue: Package version for package alsa-lib went backwards which would break package feeds (from 0:1.2.15.3-r0 to 0:1.2.15.1-r0) [version-going-backwards]
ERROR: alsa-lib-1.2.15.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5066860962889265325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aconnect: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsa-info: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaconf: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsactl: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaloop: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsamixer: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsatplg: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-alsaucm: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amidi: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amidi: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-amixer: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplay: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi2: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aplaymidi2: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi2: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-arecordmidi2: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqdump: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqnet: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-aseqsend: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-axfer: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-axfer: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGSIZE changed from 2479536 to 2481864 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dbg: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-dev: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-doc: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-iecset: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-de: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-eu: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-fr: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ja: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ka: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ko: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-ru: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-locale-sk: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhlt-dmic-info: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-nhlt-dmic-info: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-speaker-test: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: FILELIST: directory renamed /usr/src/debug/alsa-utils/1.2.15.1/amidi -> /usr/src/debug/alsa-utils/1.2.15.2/amidi, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt/intel/ssp -> /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt/intel/ssp, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/alsactl -> /usr/src/debug/alsa-utils/1.2.15.2/alsactl, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/amixer -> /usr/src/debug/alsa-utils/1.2.15.2/amixer, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/aplay -> /usr/src/debug/alsa-utils/1.2.15.2/aplay, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/iecset -> /usr/src/debug/alsa-utils/1.2.15.2/iecset, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/seq/aseqdump -> /usr/src/debug/alsa-utils/1.2.15.2/seq/aseqdump, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/speaker-test -> /usr/src/debug/alsa-utils/1.2.15.2/speaker-test, directory renamed /usr/src/
 debug/alsa-utils/1.2.15.1/alsamixer -> /usr/src/debug/alsa-utils/1.2.15.2/alsamixer, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/alsaucm -> /usr/src/debug/alsa-utils/1.2.15.2/alsaucm, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/topology -> /usr/src/debug/alsa-utils/1.2.15.2/topology, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/nhlt -> /usr/src/debug/alsa-utils/1.2.15.2/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt -> /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/seq/aconnect -> /usr/src/debug/alsa-utils/1.2.15.2/seq/aconnect, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt/intel -> /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt/intel, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/seq/aseqnet -> /usr/src/debug/alsa-utils/1.2.15.2/seq/aseqnet, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/alsaloop -> /usr/src/debug/alsa-utils/1.2.15.2/alsalo
 op, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/seq/aplaymidi2 -> /usr/src/debug/alsa-utils/1.2.15.2/seq/aplaymidi2, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/topology/nhlt/intel/dmic -> /usr/src/debug/alsa-utils/1.2.15.2/topology/nhlt/intel/dmic, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/axfer -> /usr/src/debug/alsa-utils/1.2.15.2/axfer, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/seq/aseqsend -> /usr/src/debug/alsa-utils/1.2.15.2/seq/aseqsend, directory renamed /usr/src/debug/alsa-utils/1.2.15.1/seq/aplaymidi -> /usr/src/debug/alsa-utils/1.2.15.2/seq/aplaymidi
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGSIZE changed from 1466616 to 1467743 (+0%)
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-src: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils-staticdev: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils/alsa-utils: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils: PV changed from "1.2.15.1" to "1.2.15.2"
packages/x86-64-v3-poky-linux/alsa-utils: PKGV changed from 1.2.15.1 [default] to 1.2.15.2 [default]
packages/x86-64-v3-poky-linux/alsa-utils: SRC_URI changed from "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.15.1.tar.bz2" to "https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.15.2.tar.bz2"

--===============5066860962889265325==--

