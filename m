Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512CFC3DA43
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1302.1715794340236368515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AzPRbCEy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H8m3AsAL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018f7d4fe743-54c36d36-34eb-414e-8753-1f9350dfb109-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lx8GUT7C6KGjoY2tpM8eDzHvoJo/mWDD1ftUGOuQ/PU=;
	b=AzPRbCEyTl3+W1minvNvuC6nDENAx8SOsAN1otULas6jB/8hK62CNbvEDdLdjWiN
	p06gkINR+JddE0w52gOxpcGKw/dvNaP5mbiZ39yS32tVeHzueUsIL5W5xrBhONQWcYI
	9BhthIjtYK6HZfFItC9CW9NqSEgSxlUWvr4EiC44=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lx8GUT7C6KGjoY2tpM8eDzHvoJo/mWDD1ftUGOuQ/PU=;
	b=H8m3AsALhYVWPgjC5TyY5MXvVaKcCOQ36pUrObzhQSIU5DhqNxHUhNPrWX4JmNsF
	47Zm+/Avnbgx5Qzgj3PSWEJxk/6vAXAPXO8MVareua95NTXhWuIO9l7LAVO1z57uR0c
	SCu6HwB8YCycRuu+/KS6SCIu5Bhm+0sNM2nQJOmQ=
Content-Type: multipart/mixed; boundary="===============6588166228921055272=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.7.3 SUCCEEDED
Message-ID: <0101018f7d4fe743-54c36d36-34eb-414e-8753-1f9350dfb109-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199414

--===============6588166228921055272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *enchant2* to *2.7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.7.2-2.7.3.patch
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
From 696ed16ab960a357388dc91cfcb7116f07354520 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 16:27:04 +0000
Subject: [PATCH] enchant2: upgrade 2.7.2 -> 2.7.3

---
 .../enchant/{enchant2_2.7.2.bb => enchant2_2.7.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.7.2.bb => enchant2_2.7.3.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.7.2.bb b/meta/recipes-support/enchant/enchant2_2.7.3.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.7.2.bb
rename to meta/recipes-support/enchant/enchant2_2.7.3.bb
index 08998dd48f..d5073b6f31 100644
--- a/meta/recipes-support/enchant/enchant2_2.7.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.7.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7cc3400a6657974a740b6e3c2568e2935c70e5302f07fadb2095366b75ecad6f"
+SRC_URI[sha256sum] = "fe6ad4cbe8c71b9384ffdef962be52d4d2bd5ebfb6351435bb390543d4f78b1e"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.44.0


--===============6588166228921055272==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.7.2-2.7.3.patch"

RnJvbSA2OTZlZDE2YWI5NjBhMzU3Mzg4ZGM5MWNmY2I3MTE2ZjA3MzU0NTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTY6Mjc6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bmNoYW50MjogdXBncmFkZSAyLjcuMiAtPiAyLjcuMwoKLS0tCiAuLi4vZW5jaGFudC97ZW5jaGFu
dDJfMi43LjIuYmIgPT4gZW5jaGFudDJfMi43LjMuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9lbmNoYW50L3tlbmNoYW50Ml8yLjcuMi5iYiA9PiBlbmNoYW50Ml8yLjcu
My5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2Vu
Y2hhbnQyXzIuNy4yLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8y
LjcuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuNy4zLmJiCmluZGV4IDA4OTk4ZGQ0OGYuLmQ1MDczYjZm
MzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi43
LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC9lbmNoYW50Ml8yLjcuMy5i
YgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdyb2ZmLW5hdGl2ZSIKIGlu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWItcmVsZWFzZXMKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L2VuY2hhbnQtJHtQVn0udGFyLmd6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjdjYzM0MDBhNjY1Nzk3NGE3NDBiNmUzYzI1NjhlMjkzNWM3
MGU1MzAyZjA3ZmFkYjIwOTUzNjZiNzVlY2FkNmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmU2
YWQ0Y2JlOGM3MWI5Mzg0ZmZkZWY5NjJiZTUyZDRkMmJkNWViZmI2MzUxNDM1YmIzOTA1NDNkNGY3
OGIxZSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9BYmlXb3JkL2Vu
Y2hhbnQvcmVsZWFzZXMiCiAKLS0gCjIuNDQuMAoK

--===============6588166228921055272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 31 recipes from the core2-64 sysroot...done.
Removing 32 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ee028141133f70e86e29eaf6c7b69a1541b1a018"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ee028141133f70e86e29eaf6c7b69a1541b1a018"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 306 Local 297 Mirrors 0 Missed 9 Current 233 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 239 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 240 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 241 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 245 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 252 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 254 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 327 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 328 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 330 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 758 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.7.3-r0: task do_fetch: Started
NOTE: recipe enchant2-2.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 759 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.7.3-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 361 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.7.3-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 760 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_patch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.7.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 408 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 411 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 424 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 431 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 433 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 437 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 442 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/bash-completion/2.13.0/temp/log.do_packagedata_setscene.2542769
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 448 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.13.0-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 486 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 507 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 528 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 529 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1421 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.13.0.bb:do_packagedata)
NOTE: Running task 1464 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1525 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_configure)
NOTE: recipe enchant2-2.7.3-r0: task do_configure: Started
NOTE: recipe enchant2-2.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_compile)
NOTE: recipe enchant2-2.7.3-r0: task do_compile: Started
NOTE: recipe enchant2-2.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_install)
NOTE: recipe enchant2-2.7.3-r0: task do_install: Started
NOTE: recipe enchant2-2.7.3-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package)
NOTE: Running task 1530 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package: Started
NOTE: recipe enchant2-2.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_packagedata)
NOTE: recipe enchant2-2.7.3-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.7.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_packagedata unihash changed to 3c807f7c483ff7d591a50c92fffb670f4b77fba0f0fdf6d736f88216b4ebd922
NOTE: Setscene tasks completed
NOTE: Running task 1532 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_create_spdx)
NOTE: Running task 1533 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_write_ipk)
NOTE: Running task 1534 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_write_deb)
NOTE: Running task 1535 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_write_rpm)
NOTE: Running task 1536 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_qa)
NOTE: recipe enchant2-2.7.3-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package_write_ipk: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package_write_deb: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package_write_rpm: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package_qa: Started
NOTE: recipe enchant2-2.7.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_write_ipk unihash changed to a16e19a8a94991adc317980ff0057a4a1b31f1032ab389a74e8beaa38836a2ec
NOTE: recipe enchant2-2.7.3-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.7.3-r0: task do_package_qa: Succeeded
NOTE: Running task 1537 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_create_runtime_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_qa unihash changed to da94f75f4bda66ef4bbe24bc01098290f99642777d162fa25eac91d57aef465b
NOTE: recipe enchant2-2.7.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_write_deb unihash changed to 33a7aba19413855df6f60a7aa70d3f823def4bd23633777f2d12c406ce57c666
NOTE: recipe enchant2-2.7.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_package_write_rpm unihash changed to 1b65ae892af7aa5f058db87841e242e05381f246dcabe4e9dcbf465b8a0188bf
NOTE: recipe enchant2-2.7.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe enchant2-2.7.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1538 of 1538 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.7.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1538 tasks of which 1519 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-extra went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-locale went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.0-r0) [version-going-backwards]
ERROR: bash-completion-2.13.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6588166228921055272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.7.2", added "/usr/lib/.debug/libenchant-2.so.2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 331584 to 328952 (-1%)
packages/core2-64-poky-linux/enchant2/enchant2-dbg: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2-dev: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2-doc: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2-locale: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 352494 to 352394 (-0%)
packages/core2-64-poky-linux/enchant2/enchant2-src: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.7.2", added "/usr/lib/libenchant-2.so.2.7.3"
packages/core2-64-poky-linux/enchant2/enchant2: PV changed from "2.7.2" to "2.7.3"
packages/core2-64-poky-linux/enchant2: PKGV changed from 2.7.2 [default] to 2.7.3 [default]
packages/core2-64-poky-linux/enchant2: SRC_URI changed from "https://github.com/AbiWord/enchant/releases/download/v2.7.2/enchant-2.7.2.tar.gz" to "https://github.com/AbiWord/enchant/releases/download/v2.7.3/enchant-2.7.3.tar.gz"
packages/core2-64-poky-linux/enchant2: PV changed from "2.7.2" to "2.7.3"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.7.2 to libenchant-2.so.2.7.3
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.7.2 to libenchant-2.so.2.7.3
  /usr/lib/libenchant-2.so.2.7.2 moved to /usr/lib/libenchant-2.so.2.7.3

--===============6588166228921055272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.7.2", added "/usr/lib/libenchant-2.so.2.7.3"
Changes to packages/core2-64-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.7.2 to libenchant-2.so.2.7.3
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.7.2 to libenchant-2.so.2.7.3
  /usr/lib/libenchant-2.so.2.7.2 moved to /usr/lib/libenchant-2.so.2.7.3

--===============6588166228921055272==--

