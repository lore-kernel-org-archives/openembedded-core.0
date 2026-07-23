Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B86C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 05:21:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17385.1784784080219797198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 22:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XZ9XXREe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H/MSwxTL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f8d6bc73c-871c5c1d-9be5-4bb0-b9c5-eae590510fdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784784079;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NOzZ4rr/x3iW3CWbJ0ouuWesBg8y/JH5o1fWaxrC9Jc=;
	b=XZ9XXREeDViGFIH+gaHYucBtHjhCYNBBojNwAhU71829DibxiFes3NfdhNr4Jzqq
	Il2iDNdrCQbpup9n8RtAh3iZPBRQpBCm/aUMqh3tqOm4HreVXuTAdiziKP00wNlTeAu
	7JHR9agTTG07EpwaWA8qG/wCgA0kMBREjVD7ePB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784784079;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NOzZ4rr/x3iW3CWbJ0ouuWesBg8y/JH5o1fWaxrC9Jc=;
	b=H/MSwxTL8mnSVjTZPXR2IOQymgE2/1SIWbW0NHuHSuSvrp3bh3bSLpXOac+CNMCH
	TU85AOqdkkwWuUMUB/Dbq7/wMMcBo6OnC+n9ds1mD6w9RcDaaztkNOdAeGjELf41CWY
	q8we072Fd2MAAAOMuINb/Jb2B6SgEJp87mkxLTdo=
Content-Type: multipart/mixed; boundary="===============1909996448130998264=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.160.0 FAILED
Message-ID: <0101019f8d6bc73c-871c5c1d-9be5-4bb0-b9c5-eae590510fdc-000000@us-west-2.amazonses.com>
Date: Thu, 23 Jul 2026 05:21:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.23-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241768

--===============1909996448130998264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.160.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.7-6.160.0.patch
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
From e73e2d911d634b87b9121cf3fa0cfbc0719a7178 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 23 Jul 2026 05:17:14 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.7 -> 6.160.0

---
 ...hon3-hypothesis_6.155.7.bb => python3-hypothesis_6.160.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.7.bb => python3-hypothesis_6.160.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb
index 70ae7877a1..6cefbf8866 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413acb1fd5da63f7ea"
+SRC_URI[sha256sum] = "149400acbb7382e2ce6810a52e86a9fd6d4e5c4a47660818abb438cde76aa5d1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============1909996448130998264==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.7-6.160.0.patch"

RnJvbSBlNzNlMmQ5MTFkNjM0Yjg3YjkxMjFjZjNmYTBjZmJjMDcxOWE3MTc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjMgSnVsIDIwMjYgMDU6MTc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuNyAtPiA2LjE2MC4wCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2MC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2MC4wLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTYwLjAu
YmIKaW5kZXggNzBhZTc4NzdhMS4uNmNlZmJmODg2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuNy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2MC4wLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOGQ2MDkxNzUzZDA2NjlkYjNjOTBjNWU1
YjM0NmNiMzdjNzJmM2RkOTM3OGM4NDEzYWNiMWZkNWRhNjNmN2VhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjE0OTQwMGFjYmI3MzgyZTJjZTY4MTBhNTJlODZhOWZkNmQ0ZTVjNGE0NzY2MDgxOGFi
YjQzOGNkZTc2YWE1ZDEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============1909996448130998264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-455fe5c143c8afd44aada32ea473d03d4f377665"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:455fe5c143c8afd44aada32ea473d03d4f377665"
meta-yocto-bsp       
meta-poky            = "master:a2d58939340dc0c9ea4c2f875ddcefbc499c3838"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 538 Local 519 Mirrors 0 Missed 19 Current 351 (96% match, 97% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 427 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 494 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 538 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx_setscene)
NOTE: Running task 461 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_recipe_qa)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_setscene)
NOTE: Running setscene task 715 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 730 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 592 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_fetch)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 739 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 740 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_fetch: Started
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 814 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1315 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_unpack: Succeeded
NOTE: Running task 1526 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_patch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_patch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 853 of 889 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 855 of 889 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_patch: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1841 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1852 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2119 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_create_recipe_spdx)
NOTE: Running task 2168 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2169 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_configure: Succeeded
NOTE: Running task 2170 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2171 of 2188 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'maturin'
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend 'maturin' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/run.do_compile.3494323:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/sources/hypothesis-6.160.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/run.do_compile.3494323, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/run.do_compile.3494323, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/run.do_compile.3494323, line 163
NOTE: recipe python3-hypothesis-6.160.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2171 tasks of which 2160 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260723051701.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260723051701.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/log.do_compile.3494323
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hypothesis-6.160.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/run.do_compile.3494323' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.160.0/temp/log.do_compile.3494323
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.160.0.bb:do_compile) failed with exit code '1'

--===============1909996448130998264==--

