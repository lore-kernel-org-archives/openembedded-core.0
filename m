Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B31ECCFA1D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2369.1762384584104810107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1lKFpsnX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s+fU3qzx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a564ed0fd-5afab45b-f3f7-4de6-9126-fd1358235e36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nlu9w5hckNgYkoiuzIE/IJyBSloKOqbT3YECDfaAVjM=;
	b=1lKFpsnXUzHABcvJRwZSzFe4uFPDDvDBkb4sT/AYi/gtP/Xsz6+sm8eN8A6fZb/G
	ycna1Gii4oilWmuL2SGSnE0+rOz6UTEeM/l1QSWt7PofR7pW2eucQGkqfsdunYilW5k
	eqbwdjVeEFk5hlyJIRVqudH5G/eK5wPT1xMF49rA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384597;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nlu9w5hckNgYkoiuzIE/IJyBSloKOqbT3YECDfaAVjM=;
	b=s+fU3qzxJU6Ssv1CCl1Cj8VvBr2F62XJGsvhibO4O4Dabs3W8YTNbV2ymsuNyV7K
	T8lPTziLPUWEGERC9c/vD21Y6EWcfUzEGapl/KfFvO8tHN7In5FeY4FXOeCQfXyzU44
	5v/pOTwcWJdf0x8iWwGF+LVbeW/ReclDTkAm7hS8=
Content-Type: multipart/mixed; boundary="===============3710245827436570840=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Ecom=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libadwaita: upgrading to 1.8.1 FAILED
Message-ID: <0101019a564ed0fd-5afab45b-f3f7-4de6-9126-fd1358235e36-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225874

--===============3710245827436570840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libadwaita* to *1.8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libadwaita-upgrade-1.7.6-1.8.1.patch
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
From 4da6adec37f7b6a2236ddcd10ea68851b7c30047 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:02:25 +0000
Subject: [PATCH] libadwaita: upgrade 1.7.6 -> 1.8.1

---
 .../libadwaita/{libadwaita_1.7.6.bb => libadwaita_1.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.6.bb => libadwaita_1.8.1.bb} (88%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
similarity index 88%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
index 6e5eca38de..16ef1db38f 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "5eacc5550f0bdbba6a1568aebf25a3d88f5ee07d6b558becc6fd9487579c9a29"
+SRC_URI[archive.sha256sum] = "8b1d4d5f89373a5b6eea8d93ecdaee34cd26ad27a4dd396c06f5d9929fb313bc"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.47.1


--===============3710245827436570840==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libadwaita-upgrade-1.7.6-1.8.1.patch"

RnJvbSA0ZGE2YWRlYzM3ZjdiNmEyMjM2ZGRjZDEwZWE2ODg1MWI3YzMwMDQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDowMjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmFkd2FpdGE6IHVwZ3JhZGUgMS43LjYgLT4gMS44LjEKCi0tLQogLi4uL2xpYmFkd2FpdGEve2xp
YmFkd2FpdGFfMS43LjYuYmIgPT4gbGliYWR3YWl0YV8xLjguMS5iYn0gICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYmFkd2FpdGEve2xpYmFkd2FpdGFfMS43LjYuYmIgPT4gbGliYWR3YWl0
YV8xLjguMS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3
YWl0YS9saWJhZHdhaXRhXzEuNy42LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEv
bGliYWR3YWl0YV8xLjguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuNy42LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuOC4xLmJiCmluZGV4IDZl
NWVjYTM4ZGUuLjE2ZWYxZGIzOGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9saWJh
ZHdhaXRhL2xpYmFkd2FpdGFfMS43LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2xpYmFk
d2FpdGEvbGliYWR3YWl0YV8xLjguMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gIiBc
CiAKIGluaGVyaXQgZ25vbWViYXNlIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gdmFs
YSBmZWF0dXJlc19jaGVjawogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1ZWFjYzU1
NTBmMGJkYmJhNmExNTY4YWViZjI1YTNkODhmNWVlMDdkNmI1NThiZWNjNmZkOTQ4NzU3OWM5YTI5
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiOGIxZDRkNWY4OTM3M2E1YjZlZWE4ZDkz
ZWNkYWVlMzRjZDI2YWQyN2E0ZGQzOTZjMDZmNWQ5OTI5ZmIzMTNiYyIKIAogQU5ZX09GX0RJU1RS
T19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAib3BlbmdsIgotLSAKMi40Ny4xCgo=

--===============3710245827436570840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7f550366481514ada29914acb79dfdb80be5d655"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:7f550366481514ada29914acb79dfdb80be5d655"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 627 Local 617 Mirrors 0 Missed 10 Current 869 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 893 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 1011 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1012 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1023 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libadwaita-1.8.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe appstream-1.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libadwaita-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1035 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1304 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1389 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1463 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1469 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1472 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2506 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_fetch)
NOTE: Running task 2613 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_write_config)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1486 of 1496 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libadwaita-1.8.1-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2714 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.8.1-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2764 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_patch)
NOTE: recipe libadwaita-1.8.1-r0: task do_patch: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3970 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4099 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4100 of 4112 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_configure)
NOTE: recipe libadwaita-1.8.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.0.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto
 -worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.0.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.9.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/y
 octo-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sass/sassc_3.6.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'gtk4', 'libgudev', 'librsvg', 'libxmlb', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayl
 and-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'appstream', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'libyaml', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext
 -native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'vala-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'libsass-native', 'sassc-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgtk_doc=false -Dintrospection=enabled -Dvapi=true -Dexamples=false...
| The Meson build system
| Version: 1.9.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/sources/libadwaita-1.8.1
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/build
| Build type: cross build
| DEPRECATION: Option "gtk_doc" is replaced by 'documentation'
| Project name: libadwaita
| Project version: 1.8.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/recipe-sysroot ld.bfd 2.45.0.20250908
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency glib-2.0 found: YES 2.86.0
| Run-time dependency gio-2.0 found: YES 2.86.0
| Dependency gtk4 found: NO. Found 4.18.6 but need: '>= 4.19.4'
| Found CMake: NO
| Run-time dependency gtk4 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gtk4
| ERROR: Subproject gtk is buildable: NO
| 
| ../sources/libadwaita-1.8.1/meson.build:41:10: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/run.do_configure.3069582:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/run.do_configure.3069582, line 177
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/run.do_configure.3069582, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/run.do_configure.3069582, line 155
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/run.do_configure.3069582, line 190
NOTE: recipe libadwaita-1.8.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4100 tasks of which 4093 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105200207.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105200207.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/log.do_configure.3069582
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libadwaita-1.8.1-r0 do_configure: meson failed
ERROR: libadwaita-1.8.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/run.do_configure.3069582' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libadwaita/1.8.1/temp/log.do_configure.3069582
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb:do_configure) failed with exit code '1'

--===============3710245827436570840==--

