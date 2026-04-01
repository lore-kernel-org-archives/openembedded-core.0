Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212F510F6FC2
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14666.1775054170143172757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LAXNcHki;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R2qPPKdS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d497923ac-fc222e1c-7ae4-4dba-9e74-2a1cd26ccdc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cez2226cmscjQ3+Z+xQdDjpLedZ6Nq3hxItp8qX4Vxg=;
	b=LAXNcHkiqO5UNh7rVvEWgmM5LqrwXQwRZAFSX7qDo6daePKI/VXglcJRy1+6UouY
	Us7R8dnog4xVf0jUZYu3D/26Em8f4Y6yBiNW/X7O6dTqfrJP0Z8oJbx3JcDCoGm3YXy
	mW4PtjLY02drLRa1eJj3ZR/OGzTrxqy8BgsdVov4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cez2226cmscjQ3+Z+xQdDjpLedZ6Nq3hxItp8qX4Vxg=;
	b=R2qPPKdSqxxqRhCCNi5IlWwy17yZy0fJRqizGN/NJWJvJ0zblSF3Rg0sCIICFa3j
	0dpxJdnsshLC7UHajH+B/cAS3L/GNzWd1b+oP6VeTK34Iot74cbbvHhLQrAV41oyEGe
	N9+StdUGcsnZ2W/BIzc0h1lohC+Am1qQZDiDAd5w=
Content-Type: multipart/mixed; boundary="===============2469153455219478155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] blueprint-compiler: upgrading to 0.20.4 SUCCEEDED
Message-ID: <0101019d497923ac-fc222e1c-7ae4-4dba-9e74-2a1cd26ccdc5-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234406

--===============2469153455219478155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *blueprint-compiler* to *0.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-blueprint-compiler-upgrade-0.20.0-0.20.4.patch
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
From 32c53630e35a04bc37a26cf2d52fcdabc918c529 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 11:52:31 +0000
Subject: [PATCH] blueprint-compiler: upgrade 0.20.0 -> 0.20.4

---
 ...eprint-compiler_0.20.0.bb => blueprint-compiler_0.20.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/blueprint-compiler/{blueprint-compiler_0.20.0.bb => blueprint-compiler_0.20.4.bb} (83%)

diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
similarity index 83%
rename from meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
rename to meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
index d3ef747629..bf357872c3 100644
--- a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.0.bb
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "aa5298cc1677cf855bd61f9671607362bd203f4f"
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=blueprint-0-20;tag=v${PV}"
+SRCREV = "31b62c24a72c1670d2d93dcdf2d130f1ae12778e"
 
 inherit meson pkgconfig python3targetconfig
 
-- 
2.47.1


--===============2469153455219478155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-blueprint-compiler-upgrade-0.20.0-0.20.4.patch"

RnJvbSAzMmM1MzYzMGUzNWEwNGJjMzdhMjZjZjJkNTJmY2RhYmM5MThjNTI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMTo1MjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJs
dWVwcmludC1jb21waWxlcjogdXBncmFkZSAwLjIwLjAgLT4gMC4yMC40CgotLS0KIC4uLmVwcmlu
dC1jb21waWxlcl8wLjIwLjAuYmIgPT4gYmx1ZXByaW50LWNvbXBpbGVyXzAuMjAuNC5iYn0gfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2JsdWVwcmludC1jb21waWxlci97Ymx1ZXByaW50LWNv
bXBpbGVyXzAuMjAuMC5iYiA9PiBibHVlcHJpbnQtY29tcGlsZXJfMC4yMC40LmJifSAoODMlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ibHVlcHJpbnQtY29tcGlsZXIvYmx1ZXBy
aW50LWNvbXBpbGVyXzAuMjAuMC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9ibHVlcHJpbnQtY29t
cGlsZXIvYmx1ZXByaW50LWNvbXBpbGVyXzAuMjAuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvYmx1ZXByaW50LWNvbXBpbGVyL2JsdWVwcmlu
dC1jb21waWxlcl8wLjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9ibHVlcHJp
bnQtY29tcGlsZXIvYmx1ZXByaW50LWNvbXBpbGVyXzAuMjAuNC5iYgppbmRleCBkM2VmNzQ3NjI5
Li5iZjM1Nzg3MmMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvYmx1ZXByaW50LWNv
bXBpbGVyL2JsdWVwcmludC1jb21waWxlcl8wLjIwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdu
b21lL2JsdWVwcmludC1jb21waWxlci9ibHVlcHJpbnQtY29tcGlsZXJfMC4yMC40LmJiCkBAIC0z
LDggKzMsOCBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvYmx1
ZXByaW50LWNvbXBpbGVyIgogTElDRU5TRSA9ICJMR1BMLTMuMC1vbmx5IgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MzAwMDIwOGQ1MzllYzA2MWI4OTliY2UxZDljZTk0
MDQiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9ibHVlcHJpbnQt
Y29tcGlsZXI7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSIKLVNSQ1JFViA9
ICJhYTUyOThjYzE2NzdjZjg1NWJkNjFmOTY3MTYwNzM2MmJkMjAzZjRmIgorU1JDX1VSSSA9ICJn
aXQ6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2JsdWVwcmludC1jb21waWxlcjtwcm90b2NvbD1o
dHRwczticmFuY2g9Ymx1ZXByaW50LTAtMjA7dGFnPXYke1BWfSIKK1NSQ1JFViA9ICIzMWI2MmMy
NGE3MmMxNjcwZDJkOTNkY2RmMmQxMzBmMWFlMTI3NzhlIgogCiBpbmhlcml0IG1lc29uIHBrZ2Nv
bmZpZyBweXRob24zdGFyZ2V0Y29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============2469153455219478155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-1fbaf812d465067d3644e0040385a79237f0580c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:1fbaf812d465067d3644e0040385a79237f0580c"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 449 Local 427 Mirrors 0 Missed 22 Current 273 (95% match, 96% complete)
done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 340 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_recipe_qa_setscene)
NOTE: Running task 512 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_write_config)
NOTE: Running task 513 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_write_config)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_write_config: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.56.1-r0: task do_write_config: Succeeded
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pygobject-3.56.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 529 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_recipe_qa)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 531 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_fetch)
NOTE: Running setscene task 361 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 362 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_fetch: Succeeded
NOTE: Running task 532 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_unpack)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 365 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 369 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-pycairo-1.29.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_unpack: Succeeded
NOTE: Running task 534 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_patch)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 535 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_fetch)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycairo-1.29.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pygobject-3.56.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 414 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running task 542 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 428 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running task 546 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_unpack)
NOTE: Running setscene task 440 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_unpack: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_deploy_source_date_epoch unihash changed to 4465ae577dcc644e96d05adacf4ed0cc91fc24d47f62c7b7f46a5d3ec7dabdca
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 456 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 466 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 529 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 540 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 841 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 916 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_create_recipe_spdx)
NOTE: Running task 917 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_create_recipe_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 938 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 584 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 586 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 599 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 604 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 606 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 616 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xz/5.8.2/temp/log.do_packagedata_setscene.2335287
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 628 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 639 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_package_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_package_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 672 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 683 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 722 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-arm-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1590 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata)
NOTE: Running task 1659 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1662 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.2-r0: task do_packagedata: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1703 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_configure)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_configure: Started
NOTE: Running task 1704 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_configure)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_configure: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_compile)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_compile: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_install)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_configure: Succeeded
NOTE: Running task 1707 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_compile)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_compile: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 1708 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_package)
NOTE: Running task 1709 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_populate_sysroot)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_package: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygobject-3.56.1-r0: task do_compile: Succeeded
NOTE: Running task 1710 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_install)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_install: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 1711 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_packagedata)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_install: Succeeded
NOTE: Running task 1712 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_package)
NOTE: Running task 1713 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_package: Started
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1714 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.20.4.bb:do_create_spdx)
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe blueprint-compiler-0.20.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygobject-3.56.1-r0: task do_package: Succeeded
NOTE: Running task 1715 of 1726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.56.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.56.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1715 tasks of which 1686 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401115205.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401115205.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pygobject/3.56.1/temp/log.do_packagedata.2338738
Summary: There were 42 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ka went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-nl went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-src went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dbg went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-staticdev went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-dev went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-doc went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject-locale went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: QA Issue: Package version for package python3-pygobject went backwards which would break package feeds (from 0:3.56.2-r0 to 0:3.56.1-r0) [version-going-backwards]
ERROR: python3-pygobject-3.56.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pygobject/3.56.1/temp/log.do_packagedata.2338738
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.56.1.bb:do_packagedata) failed with exit code '1'

--===============2469153455219478155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-dbg: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-dbg: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-dev: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-dev: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-doc: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-doc: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-locale: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-locale: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-python: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-python: PKGSIZE changed from 1208617 to 1216511 (+1%)
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-python: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-src: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-src: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-staticdev: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler-staticdev: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler/blueprint-compiler: PV changed from "0.20.0" to "0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler: PKGV changed from 0.20.0 [default] to 0.20.4 [default]
packages/x86-64-v3-poky-linux/blueprint-compiler: SRC_URI changed from "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=v0.20.0" to "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=blueprint-0-20;tag=v0.20.4"
packages/x86-64-v3-poky-linux/blueprint-compiler: PV changed from "0.20.0" to "0.20.4"

--===============2469153455219478155==--

