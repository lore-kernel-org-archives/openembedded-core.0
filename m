Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C11C55162
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6125.1785309869367851528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z6Pbibp1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pjjaDigq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019facc2b14f-3ec4cebb-9323-4b54-8854-13c0fa150277-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iSJ9bKVMYlcrCkv7U6MmWmqzX1JL9UXRQ8Xt07ExP1A=;
	b=Z6Pbibp1t/Duw6sxD3xmsZ76sZMJNGjUIR5Gm5/TQuEZB9hQq535JT21KNEFE1qu
	9RYQHoZMeXVk7bLh0X2R8Wgc4NmhuH45ufgjgLNhzOJjBLf/lmZg3XGBLnUphQU0dg7
	H6BgfchxdDWBWsaIeCMfdvMTh7ByafGwYEY3fxgM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iSJ9bKVMYlcrCkv7U6MmWmqzX1JL9UXRQ8Xt07ExP1A=;
	b=pjjaDigqGjSGzhtGBbv/3NXoVmEZ272PqT8kz8zqKT0pFfMv723TaNHKAUNSnJCw
	ruEFyK5Xi1S86TeN/aOXRYjFAYG6kvzbYmNS/iE+TKD0bc44di3nKfaWj4PBQmXpa2L
	KqAXT/oGH0ouW9FNb6D1ToeOXwn9RbihL7DM9Otg=
Content-Type: multipart/mixed; boundary="===============0925141146306985661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.163.0 FAILED
Message-ID: <0101019facc2b14f-3ec4cebb-9323-4b54-8854-13c0fa150277-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242243

--===============0925141146306985661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.163.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.7-6.163.0.patch
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
From cd53ec9c1bd85a09ccad9877a1468c10d8a06782 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 05:41:00 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.7 -> 6.163.0

---
 ...hon3-hypothesis_6.155.7.bb => python3-hypothesis_6.163.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.7.bb => python3-hypothesis_6.163.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb
index 70ae7877a1..d37f0b91c5 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413acb1fd5da63f7ea"
+SRC_URI[sha256sum] = "520480d4bd3a17557616c25923640953e360332c89d012fffcebd69857e674a9"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============0925141146306985661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.7-6.163.0.patch"

RnJvbSBjZDUzZWM5YzFiZDg1YTA5Y2NhZDk4NzdhMTQ2OGMxMGQ4YTA2NzgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDU6NDE6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuNyAtPiA2LjE2My4wCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2My4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2My4wLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2My4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTYzLjAu
YmIKaW5kZXggNzBhZTc4NzdhMS4uZDM3ZjBiOTFjNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuNy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2My4wLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOGQ2MDkxNzUzZDA2NjlkYjNjOTBjNWU1
YjM0NmNiMzdjNzJmM2RkOTM3OGM4NDEzYWNiMWZkNWRhNjNmN2VhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjUyMDQ4MGQ0YmQzYTE3NTU3NjE2YzI1OTIzNjQwOTUzZTM2MDMzMmM4OWQwMTJmZmZj
ZWJkNjk4NTdlNjc0YTkiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============0925141146306985661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 954 .bb files complete (0 cached, 954 parsed). 1983 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c35777e80d9ab96f6b4226b0a201fdc6a8f65067"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c35777e80d9ab96f6b4226b0a201fdc6a8f65067"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 406 Local 387 Mirrors 0 Missed 19 Current 465 (95% match, 97% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 489 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 529 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running task 854 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_recipe_qa)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 762 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 782 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_spdx_setscene)
NOTE: Running task 1229 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 786 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 787 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1372 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_unpack)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 790 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_patch)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_patch: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_patch: Succeeded
NOTE: Running task 1437 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1438 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_populate_lic)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 819 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_populate_lic: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 823 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 824 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 852 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 860 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1590 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 867 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1866 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2137 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_configure: Succeeded
NOTE: Running task 2138 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2139 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'maturin'
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend 'maturin' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/run.do_compile.1562336:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/sources/hypothesis-6.163.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/run.do_compile.1562336, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/run.do_compile.1562336, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/run.do_compile.1562336, line 163
NOTE: recipe python3-hypothesis-6.163.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2139 tasks of which 2128 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729054044.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260729054044.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/log.do_compile.1562336
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hypothesis-6.163.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/run.do_compile.1562336' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.163.0/temp/log.do_compile.1562336
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.163.0.bb:do_compile) failed with exit code '1'

--===============0925141146306985661==--

