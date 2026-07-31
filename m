Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF85C55171
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:35:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.500.1785476095622146073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=q/r7XTvC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e8nd7LaU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019fb6ab19fa-ee9a7f53-4404-45b9-b41d-42be8a22c59b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785476094;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mjnTKEvJfSonJiDqxVwlkURa2qOjTMEoU5n++Yp2pQA=;
	b=q/r7XTvC7P3VWHZXGz2YUWBU93KqTEbdKvFQRt1WWWANBToDm6kskZTVKIoYvNr4
	6GD+kEch/2LWcDXNBbqW0t8qULLDcTNBw50E66OP5q0+fl9G44JdRHU8W+LirvXly/L
	vi8rbnS85C3TdGO2k1W8C+yTuPezHxsnMC0dplaw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785476094;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mjnTKEvJfSonJiDqxVwlkURa2qOjTMEoU5n++Yp2pQA=;
	b=e8nd7LaUmD0xCw5mIMMSVjyDall4y27rL1OEVAXF/+zTZ8AxPwaNu4yxoBp3Mlts
	Nd9+3bwCuT159QNZ3bwWMxuTkA1YH+X1AGY0qg1cVkUhtu1UYk/yo+kaZ2Pn0ZbO6Ra
	WA/4EC+SFl6UwlvT3vaIfF1LQTbrCH7hSPnVuwmg=
Content-Type: multipart/mixed; boundary="===============7798789292617968103=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.164.0 FAILED
Message-ID: <0101019fb6ab19fa-ee9a7f53-4404-45b9-b41d-42be8a22c59b-000000@us-west-2.amazonses.com>
Date: Fri, 31 Jul 2026 05:34:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.31-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242392

--===============7798789292617968103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.164.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.7-6.164.0.patch
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
From 91f6fd8b9fac9cdf53dea34ca978778c0d7ee79d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 31 Jul 2026 05:19:19 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.7 -> 6.164.0

---
 ...hon3-hypothesis_6.155.7.bb => python3-hypothesis_6.164.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.7.bb => python3-hypothesis_6.164.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb
index 70ae7877a1..a5d582bdc6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413acb1fd5da63f7ea"
+SRC_URI[sha256sum] = "5d63d263d8c71b571638c18d9591f6e34b836c60a12469e9d9105c1c785f00f1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============7798789292617968103==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.7-6.164.0.patch"

RnJvbSA5MWY2ZmQ4YjlmYWM5Y2RmNTNkZWEzNGNhOTc4Nzc4YzBkN2VlNzlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzEgSnVsIDIwMjYgMDU6MTk6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuNyAtPiA2LjE2NC4wCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE2NC4wLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE2NC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjcuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTY0LjAu
YmIKaW5kZXggNzBhZTc4NzdhMS4uYTVkNTgyYmRjNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuNy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE2NC4wLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkOGQ2MDkxNzUzZDA2NjlkYjNjOTBjNWU1
YjM0NmNiMzdjNzJmM2RkOTM3OGM4NDEzYWNiMWZkNWRhNjNmN2VhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjVkNjNkMjYzZDhjNzFiNTcxNjM4YzE4ZDk1OTFmNmUzNGI4MzZjNjBhMTI0NjllOWQ5
MTA1YzFjNzg1ZjAwZjEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============7798789292617968103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-9949e7d68fd7be16d420492ff39655b684f75001"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9949e7d68fd7be16d420492ff39655b684f75001"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 607 Local 590 Mirrors 0 Missed 17 Current 264 (97% match, 98% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 291 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 301 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 316 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 351 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx_setscene)
NOTE: Running task 309 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_recipe_qa)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 569 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_package_setscene)
NOTE: Running setscene task 573 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 476 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 598 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 599 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_fetch: Started
NOTE: Running setscene task 602 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 649 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_fetch: Succeeded
NOTE: Running task 514 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_unpack)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_unpack: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 652 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 661 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 705 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-build-native-1.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-attrs-26.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 715 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_26.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-26.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1051 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_patch)
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1291 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1303 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_populate_lic: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1866 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2137 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_configure: Succeeded
NOTE: Running task 2138 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2139 of 2156 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'maturin'
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend 'maturin' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/run.do_compile.3699098:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/sources/hypothesis-6.164.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/run.do_compile.3699098, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/run.do_compile.3699098, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/run.do_compile.3699098, line 163
NOTE: recipe python3-hypothesis-6.164.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2139 tasks of which 2128 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260731051901.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260731051901.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/log.do_compile.3699098
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hypothesis-6.164.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/run.do_compile.3699098' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-hypothesis/6.164.0/temp/log.do_compile.3699098
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.164.0.bb:do_compile) failed with exit code '1'

--===============7798789292617968103==--

