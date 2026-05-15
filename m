Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA50CD5BB5
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34832.1778851233021692824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BPkyPHge;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wftyOYpB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e2bcbba4f-5ae61e22-18b8-4c82-9d79-733ab58a504f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851232;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M9KCPiTbGQAHxSTxBuQ9IE4AXXkWrRoyTf+BGgIlBS0=;
	b=BPkyPHge9Qbdfb9rLedHxpb62sUYWeKiloWvOb6zgOJCwPNXccTRHam8HgXH09KD
	T57Tv1lustMBbK8qHlMN32mvWTAjRWLkvFFzkNOpv/rXlvMJK2G4an5owPkiV+yaBMr
	Tp4AIhGcpGxBp/JPIHZyr2pPVAT/jbEP+3CTsThc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851232;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M9KCPiTbGQAHxSTxBuQ9IE4AXXkWrRoyTf+BGgIlBS0=;
	b=wftyOYpB2iYj8cvH5WLt4h/PZPxm+ooMrWyypxvWalDzjhrgjRcVW/8mkTNXKssb
	5OjwWEqPPWOqUVgeZsbXJiVNVkAKMGazexykVowcEKi4r8q+t+Y2+IoaCI6nIE8/Gvh
	BX2NMmSfzaUBvepaf2zMBJRTbVTPS35KF/3sZsVI=
Content-Type: multipart/mixed; boundary="===============5444618525230297804=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.56.3 SUCCEEDED
Message-ID: <0101019e2bcbba4f-5ae61e22-18b8-4c82-9d79-733ab58a504f-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237120

--===============5444618525230297804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygobject* to *3.56.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.56.2-3.56.3.patch
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
From 5d418b0b2f23f2253af5b072472314dc518a188a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 08:53:19 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.56.2 -> 3.56.3

---
 ...{python3-pygobject_3.56.2.bb => python3-pygobject_3.56.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.2.bb => python3-pygobject_3.56.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
index 24a58adee6..e246a2d451 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "b816098969544081de9eecedb94ad6ac59c77e4d571fe7051f18bebcec074313"
+SRC_URI[archive.sha256sum] = "12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============5444618525230297804==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.56.2-3.56.3.patch"

RnJvbSA1ZDQxOGIwYjJmMjNmMjI1M2FmNWIwNzI0NzIzMTRkYzUxOGExODhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDg6NTM6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z29iamVjdDogdXBncmFkZSAzLjU2LjIgLT4gMy41Ni4zCgotLS0KIC4uLntweXRo
b24zLXB5Z29iamVjdF8zLjU2LjIuYmIgPT4gcHl0aG9uMy1weWdvYmplY3RfMy41Ni4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYu
Mi5iYiA9PiBweXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlnb2JqZWN0XzMuNTYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmIKaW5kZXggMjRhNThh
ZGVlNi4uZTI0NmEyZDQ1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z29iamVjdF8zLjU2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5Z29iamVjdF8zLjU2LjMuYmIKQEAgLTE5LDcgKzE5LDcgQEAgREVQ
RU5EUyArPSAicHl0aG9uMyBnbGliLTIuMCIKIEdOT01FX0NPTVBSRVNTX1RZUEUgPSAiZ3oiCiBH
Tk9NRUJOID0gInB5Z29iamVjdCIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiYjgx
NjA5ODk2OTU0NDA4MWRlOWVlY2VkYjk0YWQ2YWM1OWM3N2U0ZDU3MWZlNzA1MWYxOGJlYmNlYzA3
NDMxMyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjEyNzYwZTRhMGUzZDA0YjZlYjk1
ZTA2ZjdhMjdlMzYyYzgyNmQ1NjdlYTYxMzM3M2E5MmMwMDNiNmM3MGQyZDYiCiAKIFMgPSAiJHtV
TlBBQ0tESVJ9LyR7R05PTUVCTn0tJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============5444618525230297804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-66d2c13aa92448e285244d4525deb01874f26b25"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:66d2c13aa92448e285244d4525deb01874f26b25"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 616 Local 558 Mirrors 0 Missed 58 Current 306 (90% match, 93% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 322 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 333 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 334 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 361 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 404 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 437 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 441 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 922 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 446 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 449 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 457 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 463 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 471 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 473 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 480 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 483 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 488 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 495 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 511 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 515 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 519 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 523 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 546 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 559 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 582 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 593 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 605 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 609 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 622 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 625 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 627 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 634 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 641 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 664 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 673 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 679 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 686 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 688 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 709 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 712 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 730 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 748 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 757 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 758 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 770 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 771 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 779 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 788 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 790 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 827 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 834 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 843 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 933 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_fetch)
NOTE: Running task 984 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1056 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 1058 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_fetch)
NOTE: Running task 1118 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 1121 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 891 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Started
NOTE: Running task 1185 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: Running task 1188 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_fetch)
NOTE: Running task 1205 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: Running task 1230 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: Running task 1231 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_write_config)
NOTE: Running task 1239 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_fetch)
NOTE: Running task 1247 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_unpack)
NOTE: Running task 1256 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1276 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running task 1277 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe fontconfig-2.17.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1278 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_unpack)
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Started
NOTE: Running task 1285 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_fetch: Succeeded
NOTE: Running task 1303 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_unpack)
NOTE: Running task 1311 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_recipe_qa)
NOTE: Running task 1316 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_write_config)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_write_config: Succeeded
NOTE: Running task 1338 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1347 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx)
NOTE: Running task 1350 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Started
NOTE: Running task 1361 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_write_config)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Started
NOTE: Running setscene task 893 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: Running task 1362 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_unpack: Succeeded
NOTE: Running task 1363 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1364 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_write_config: Started
NOTE: Running task 1409 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_write_config: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1471 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: Running setscene task 895 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 896 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_patch)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1473 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1480 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1481 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_patch: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: Running task 1482 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_patch)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1483 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1488 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 904 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1495 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 914 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pygobject-3.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 919 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 922 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running task 1516 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1517 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1518 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: Running task 1519 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1680 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 1931 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_deploy_source_date_epoch unihash changed to d84e1468782d09b6ebe187a3f0e169ffda9241363b3e7ed7495292a88db4e2f8
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch unihash changed to d84e1468782d09b6ebe187a3f0e169ffda9241363b3e7ed7495292a88db4e2f8
NOTE: Setscene tasks completed
NOTE: Running task 2163 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_recipe_spdx)
NOTE: Running task 2167 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2183 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2184 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe fontconfig-2.17.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2185 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_configure)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2186 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_create_recipe_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2187 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: Running task 2194 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_configure: Succeeded
NOTE: Running task 2195 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_compile)
NOTE: recipe fontconfig-2.17.1-r0: task do_compile: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_compile: Succeeded
NOTE: Running task 2196 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_install)
NOTE: recipe fontconfig-2.17.1-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 2197 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_install: Succeeded
NOTE: Running task 2198 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot)
NOTE: Running task 2199 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_package)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2201 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe fontconfig-2.17.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot unihash changed to bb347b59f97e7378784abb464e4d5e442b538b2d9bde9a48c251efa379cb4a07
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to 511da41c1969f08cb2c39e4aae4ecf66a99a0a45ccbf34c28fdc31ec65f38c2f
NOTE: Setscene tasks completed
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to da25b1a940a44ffd8122a76868937c97605c0ec408b3d6e9a289f79f2775abae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: Running setscene task 922 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2203 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_package: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_package unihash changed to b97b5fd71a1c289f5b8d76fcb0d25e289fc5fe996d746ed2e95cdd65086d653d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata became valid
NOTE: Running setscene task 922 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2205 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2207 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile: Succeeded
NOTE: Running task 2208 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2209 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install: Succeeded
NOTE: Running task 2210 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2211 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2212 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2213 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2214 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2217 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2218 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot unihash changed to 73ab31f50236acb95797c10b669cc9819f90ae5ab6490e730cf4d613968874bf
NOTE: Setscene tasks completed
NOTE: Running task 2219 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package unihash changed to 346c7bacf371212f25eae72750c393d70fe7d238176880a4e63d9fbfe7a61846
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata became valid
NOTE: Running setscene task 918 of 922 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2222 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2223 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2224 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile: Succeeded
NOTE: Running task 2225 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2226 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2228 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot)
NOTE: Running task 2229 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2230 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2231 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 2233 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 2234 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2235 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2236 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_configure: Succeeded
NOTE: Running task 2237 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_compile)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_install)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2241 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2242 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_configure)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_configure: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_compile)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.56.3-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2269 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb:do_install)
NOTE: recipe python3-pygobject-3.56.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pygobject-3.56.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 2244 tasks of which 2137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515085142.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515085142.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.88.0/temp/log.do_packagedata.1929802
Summary: There were 112 ERROR messages, returning a non-zero exit code.
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.88.1-r0 to 1:2.88.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.88.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/glib-2.0/2.88.0/temp/log.do_packagedata.1929802
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata) failed with exit code '1'

--===============5444618525230297804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygobject: SRC_URI changed from "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.2.tar.gz;name=archive" to "https://download.gnome.org/sources//pygobject/3.56/pygobject-3.56.3.tar.gz;name=archive"
packages/x86-64-v3-poky-linux/python3-pygobject: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1499808 to 1503648 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 873724 to 876209 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: FILELIST: directory renamed /usr/src/debug/python3-pygobject/3.56.2/gi -> /usr/src/debug/python3-pygobject/3.56.3/gi
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.56.2" to "3.56.3"
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 1129171 to 1129203 (+0%)
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.56.2 [default] to 3.56.3 [default]
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info
packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.56.2" to "3.56.3"
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info

--===============5444618525230297804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygobject/python3-pygobject: FILELIST: directory renamed /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info -> /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.14/site-packages/PyGObject-3.56.2.dist-info moved to /usr/lib/python3.14/site-packages/PyGObject-3.56.3.dist-info

--===============5444618525230297804==--

