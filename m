Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DB6C53209
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 05:19:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5710.1785043159909715983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 22:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g0RfRN7c;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HpwmQ3EM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f9cdd070f-9725c7f2-9f4e-4fdf-af56-5ae251bdd361-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785043158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bk95VxlGvWzC8tcsv0+1vBlRjHqxOEYMvWkMrsgFhpg=;
	b=g0RfRN7coE/WARLVOygb2Kmt18sHVN2jZv2YjD6QY12DORK2s4u+2HHyWeJhs5Re
	fdFSy7ZD4FGt5XERxSmSbemZWnqyBELFpxBdBB7q61p40p2gpest4LU0KBcakqnVMUa
	wcbElyZxDk6skNa7oKvdeqOdu5S8zqc0Hl5sHWrI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785043158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bk95VxlGvWzC8tcsv0+1vBlRjHqxOEYMvWkMrsgFhpg=;
	b=HpwmQ3EM4Ycy/RkjcbtVntDknS8cRvR31FTXUNRgGI67No0HWLK4VQ1E7jjpBX8p
	gpiig5azcDY1nkLgD7cvZ9T3Ef71JSFPUb5ECTsNzY6/64zeX3F/g1W+JuikaG94TMB
	/XVkHaJBoQySnti5uK5OTx70auNeBmpdDGnxguko=
Content-Type: multipart/mixed; boundary="===============7045710618949494698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.161.5 FAILED
Message-ID: <0101019f9cdd070f-9725c7f2-9f4e-4fdf-af56-5ae251bdd361-000000@us-west-2.amazonses.com>
Date: Sun, 26 Jul 2026 05:19:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.26-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 05:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241978

--===============7045710618949494698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.161.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.7-6.161.5.patch
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
From c4018d4b3af92e86bb36aad19a1a88d16e13e448 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 26 Jul 2026 05:09:18 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.7 -> 6.161.5

---
 ...hon3-hypothesis_6.155.7.bb => python3-hypothesis_6.161.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.7.bb => python3-hypothesis_6.161.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb
index 70ae7877a1..893fdd674a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413acb1fd5da63f7ea"
+SRC_URI[sha256sum] = "ba73a3c3b68e63a0bee5ea1a8a13efce60bcc7ee5fc7e71df2954db39c225b95"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============7045710618949494698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.7-6.161.5.patch"

RnJvbSBjNDAxOGQ0YjNhZjkyZTg2YmIzNmFhZDE5YTFhODhkMTZlMTNlNDQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjYgSnVsIDIwMjYgMDU6MDk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuNyAtPiA2LjE2MS41CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2MS41LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2MS41LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2MS41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTYxLjUu
YmIKaW5kZXggNzBhZTc4NzdhMS4uODkzZmRkNjc0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuNy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2MS41LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOGQ2MDkxNzUzZDA2NjlkYjNjOTBjNWU1
YjM0NmNiMzdjNzJmM2RkOTM3OGM4NDEzYWNiMWZkNWRhNjNmN2VhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImJhNzNhM2MzYjY4ZTYzYTBiZWU1ZWExYThhMTNlZmNlNjBiY2M3ZWU1ZmM3ZTcxZGYy
OTU0ZGIzOWMyMjViOTUiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============7045710618949494698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1981 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-9a25b3e72051a30794e147564028487a598ce82d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9a25b3e72051a30794e147564028487a598ce82d"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 631 Local 614 Mirrors 0 Missed 17 Current 235 (97% match, 98% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 273 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 290 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 344 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running task 248 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_recipe_qa)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_recipe_qa: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 546 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 598 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 448 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 604 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_fetch: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_fetch: Succeeded
NOTE: Running task 449 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_unpack)
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 638 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 639 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 679 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 736 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 771 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 819 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 824 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-native-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flex-native-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe m4-native-1.4.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 866 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/m4/m4-native_1.4.21.bb:do_recipe_qa_setscene)
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-native-1.4.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 866 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_recipe_qa_setscene)
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1651 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_patch)
NOTE: Running task 1686 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_patch: Succeeded
NOTE: Running task 2122 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2123 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2124 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_configure)
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_configure: Succeeded
NOTE: Running task 2125 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2126 of 2143 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_compile)
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'maturin'
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend 'maturin' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/run.do_compile.1044478:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/sources/hypothesis-6.161.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/run.do_compile.1044478, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/run.do_compile.1044478, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/run.do_compile.1044478, line 163
NOTE: recipe python3-hypothesis-6.161.5-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2126 tasks of which 2115 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260726050902.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260726050902.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/log.do_compile.1044478
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hypothesis-6.161.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/run.do_compile.1044478' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.161.5/temp/log.do_compile.1044478
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.161.5.bb:do_compile) failed with exit code '1'

--===============7045710618949494698==--

