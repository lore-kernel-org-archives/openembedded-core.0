Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86319CD98D9
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50408.1781195498601468821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=h+kEUivV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=our5Dnoq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb786a706-2696bf6d-08e9-4cd3-83bb-140aa0f51582-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195515;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S+zCozq7GoZef4mV8+USW7aKFXapJcljhYpQ0bOyMR0=;
	b=h+kEUivVe8MBluPTfvih6Hbgk1yyEKVLiFrN4gAXPS7+7VrslRrc+hZcLyyKN0HZ
	sgP2epPgWohGo8ilqwJKnuSDHIElejafh217y4GU1dsvHMlQEm7yMynwCmDcdB6g34t
	hfwuefZPbbVabVm18ccCFU/cVgdah41zH4IPnzU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195515;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S+zCozq7GoZef4mV8+USW7aKFXapJcljhYpQ0bOyMR0=;
	b=our5DnoqZkwUGQFM5m8rQB1WPj9CfOSH5Y6SYav57PYG81AiLRauAucoZi1AA0Bv
	bOrRyQRylsNmGZN+yrIf5n+RvpPwnkdc8G1RJHZd3NaPX6p07p4vOJ56N8x9yjH3ors
	+sQxEckPJ++9ilpDP6RkhuFwQ7DfDrYqKfMpgVas=
Content-Type: multipart/mixed; boundary="===============0369830057981190676=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.4 FAILED
Message-ID: <0101019eb786a706-2696bf6d-08e9-4cd3-83bb-140aa0f51582-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238531

--===============0369830057981190676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-igt-gpu-tools-upgrade-2.3-2.4.patch
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
From db8ed1abf163f04b2b7b37c72fb9401a76931cc4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:15:31 +0000
Subject: [PATCH] igt-gpu-tools: upgrade 2.3 -> 2.4

---
 ...-meson.build-do-not-hardcode-the-build-directory-.patch | 7 +++----
 .../{igt-gpu-tools_2.3.bb => igt-gpu-tools_2.4.bb}         | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.3.bb => igt-gpu-tools_2.4.bb} (97%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
index 7ff8aa22a9..d8422633cc 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
@@ -1,4 +1,4 @@
-From 27fd94beadfc29ea4ad82f660dbdb2540d0b6b97 Mon Sep 17 00:00:00 2001
+From ebafc97afab5bcd71ca1d2013aed3b09b12e1c35 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 18 Dec 2025 15:45:11 +0100
 Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
@@ -25,7 +25,6 @@ and them IGT_IMGDIR is used thusly in lib/igt_core.h:
 #define igt_fopen_data(filename) \
         __igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
 
-
 Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
@@ -33,10 +32,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/meson.build b/lib/meson.build
-index d0487fb3c..f6452e970 100644
+index 5c4829345..d28c95d99 100644
 --- a/lib/meson.build
 +++ b/lib/meson.build
-@@ -292,7 +292,7 @@ foreach f: lib_sources
+@@ -301,7 +301,7 @@ foreach f: lib_sources
  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
similarity index 97%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
index c92d10c617..536e7a2652 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "2d7ec9a36c550c48af4bdd6e748f6753369ab8ff"
+SRCREV = "e6b603e4984e4ce30fe1cc2705734d0f130e0550"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
-- 
2.47.1


--===============0369830057981190676==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-2.3-2.4.patch"

RnJvbSBkYjhlZDFhYmYxNjNmMDRiMmI3YjM3YzcyZmI5NDAxYTc2OTMxY2M0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6MTU6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Z3QtZ3B1LXRvb2xzOiB1cGdyYWRlIDIuMyAtPiAyLjQKCi0tLQogLi4uLW1lc29uLmJ1aWxkLWRv
LW5vdC1oYXJkY29kZS10aGUtYnVpbGQtZGlyZWN0b3J5LS5wYXRjaCB8IDcgKysrLS0tLQogLi4u
L3tpZ3QtZ3B1LXRvb2xzXzIuMy5iYiA9PiBpZ3QtZ3B1LXRvb2xzXzIuNC5iYn0gICAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL3tpZ3QtZ3B1LXRvb2xz
XzIuMy5iYiA9PiBpZ3QtZ3B1LXRvb2xzXzIuNC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzLzAwMDEtbGliLW1l
c29uLmJ1aWxkLWRvLW5vdC1oYXJkY29kZS10aGUtYnVpbGQtZGlyZWN0b3J5LS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMvMDAwMS1saWIt
bWVzb24uYnVpbGQtZG8tbm90LWhhcmRjb2RlLXRoZS1idWlsZC1kaXJlY3RvcnktLnBhdGNoCmlu
ZGV4IDdmZjhhYTIyYTkuLmQ4NDIyNjMzY2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMvMDAwMS1saWItbWVzb24uYnVpbGQtZG8t
bm90LWhhcmRjb2RlLXRoZS1idWlsZC1kaXJlY3RvcnktLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMvMDAwMS1saWItbWVzb24uYnVp
bGQtZG8tbm90LWhhcmRjb2RlLXRoZS1idWlsZC1kaXJlY3RvcnktLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyN2ZkOTRiZWFkZmMyOWVhNGFkODJmNjYwZGJkYjI1NDBkMGI2Yjk3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlYmFmYzk3YWZhYjViY2Q3MWNhMWQyMDEzYWVkM2Iw
OWIxMmUxYzM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFRodSwgMTggRGVjIDIwMjUgMTU6NDU6MTEg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21lc29uLmJ1aWxkOiBkbyBub3QgaGFyZGNvZGUg
dGhlIGJ1aWxkIGRpcmVjdG9yeSBpbnRvIHRoZQpAQCAtMjUsNyArMjUsNiBAQCBhbmQgdGhlbSBJ
R1RfSU1HRElSIGlzIHVzZWQgdGh1c2x5IGluIGxpYi9pZ3RfY29yZS5oOgogI2RlZmluZSBpZ3Rf
Zm9wZW5fZGF0YShmaWxlbmFtZSkgXAogICAgICAgICBfX2lndF9mb3Blbl9kYXRhKElHVF9TUkNE
SVIsIElHVF9EQVRBRElSLCBJR1RfSU1HRElSLCBmaWxlbmFtZSkKIAotCiBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW2hhY2sgcGF0Y2hpbmcgaW4gYSBib2d1cyBkaXI7IGlzc3VlIHJl
cG9ydGVkIGF0IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29s
cy8tL2lzc3Vlcy8xOTBdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPgogLS0tCkBAIC0zMywxMCArMzIsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpYi9tZXNvbi5idWls
ZCBiL2xpYi9tZXNvbi5idWlsZAotaW5kZXggZDA0ODdmYjNjLi5mNjQ1MmU5NzAgMTAwNjQ0Citp
bmRleCA1YzQ4MjkzNDUuLmQyOGM5NWQ5OSAxMDA2NDQKIC0tLSBhL2xpYi9tZXNvbi5idWlsZAog
KysrIGIvbGliL21lc29uLmJ1aWxkCi1AQCAtMjkyLDcgKzI5Miw3IEBAIGZvcmVhY2ggZjogbGli
X3NvdXJjZXMKK0BAIC0zMDEsNyArMzAxLDcgQEAgZm9yZWFjaCBmOiBsaWJfc291cmNlcwogIAkg
ICAgJy1ESUdUX0RBVEFESVI9IkAwQCInLmZvcm1hdChqb2luX3BhdGhzKHByZWZpeCwgZGF0YWRp
cikpLAogIAkgICAgJy1ESUdUX1NSQ0RJUj0iQDBAIicuZm9ybWF0KHNyY2RpciksCiAgCSAgICAn
LURJR1RfTE9HX0RPTUFJTj0iQDBAIicuZm9ybWF0KGYuc3BsaXQoJy4nKVswXSksCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzXzIu
My5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNf
Mi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfMi4zLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzXzIuNC5iYgppbmRleCBj
OTJkMTBjNjE3Li41MzZlN2EyNjUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
aWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzXzIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzXzIuNC5iYgpAQCAtOSw3ICs5LDcgQEAg
TElDRU5TRSA9ICJNSVQiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnCiAKLVNSQ1JFViA9ICIy
ZDdlYzlhMzZjNTUwYzQ4YWY0YmRkNmU3NDhmNjc1MzM2OWFiOGZmIgorU1JDUkVWID0gImU2YjYw
M2U0OTg0ZTRjZTMwZmUxY2MyNzA1NzM0ZDBmMTMwZTA1NTAiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbGli
LW1lc29uLmJ1aWxkLWRvLW5vdC1oYXJkY29kZS10aGUtYnVpbGQtZGlyZWN0b3J5LS5wYXRjaCBc
Ci0tIAoyLjQ3LjEKCg==

--===============0369830057981190676==
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
DISTRO_VERSION       = "6.0.99+snapshot-85edb95f09b67a7af0ccf93078cec0f5dfbd0377"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:85edb95f09b67a7af0ccf93078cec0f5dfbd0377"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 263 Local 250 Mirrors 0 Missed 13 Current 804 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1047 of 1067 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2178 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_fetch)
NOTE: Running task 2334 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_write_config)
NOTE: Running task 2481 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_create_recipe_spdx)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2496 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_unpack)
NOTE: Running task 2497 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe igt-gpu-tools-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2498 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_patch)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.4-r0: task do_patch: Succeeded
NOTE: Running task 2499 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2500 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_populate_lic)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_populate_lic: Started
NOTE: recipe igt-gpu-tools-2.4-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_populate_lic unihash changed to a33b57f4c8e33c66e562f6210499ec10d3e5152529fb247d50180b06d574e5d2
NOTE: recipe igt-gpu-tools-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_deploy_source_date_epoch unihash changed to 1da6d7d54eaa25de9de0b3b53262d85ed256e9d7f4d5b4c4d5cbd43087022edc
NOTE: Setscene tasks completed
NOTE: Running task 2501 of 2513 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_configure)
NOTE: recipe igt-gpu-tools-2.4-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd_259.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/
 openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_
 sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_s
 ysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'procps', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'wayland-protocols', 'wayland', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxkbcommon', 'libxrender', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'libpng', 'acl', 'attr', 'bash-completion', 'curl', 'gdbm', 'gmp', 'gnutls', 
 'libtasn1', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'libunwind', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'bison-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/igt-gpu-tools/2.4/git/ -Dversion_hash=2.4 -Dchamelium=disabled...
| The Meson build system
| Version: 1.11.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/sources/igt-gpu-tools-2.4
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/build
| Build type: cross build
| Project name: igt-gpu-tools
| Project version: 2.4
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/recipe-sysroot (gcc 16.1.0 "x86_64-poky-linux-gcc (GCC) 16.1.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/recipe-sysroot ld.bfd 2.46
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports arguments -Wbad-function-cast: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wimplicit-fallthrough=0: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wuninitialized: YES
| Compiler for C supports arguments -Wunused: YES
| Compiler for C supports arguments -Wno-clobbered: YES
| Compiler for C supports arguments -Wno-maybe-uninitialized: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-pointer-arith: YES
| Compiler for C supports arguments -Wno-address-of-packed-member: YES
| Compiler for C supports arguments -Wno-sign-compare: YES
| Compiler for C supports arguments -Wno-type-limits: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Compiler for C supports arguments -Wno-unused-result: YES
| Compiler for C supports arguments -Werror=address: YES
| Compiler for C supports arguments -Werror=array-bounds: YES
| Compiler for C supports arguments -Werror=dangling-pointer: YES
| Compiler for C supports arguments -Werror=implicit: YES
| Compiler for C supports arguments -Werror=init-self: YES
| Compiler for C supports arguments -Werror=int-conversion: YES
| Compiler for C supports arguments -Werror=int-to-pointer-cast: YES
| Compiler for C supports arguments -Werror=main: YES
| Compiler for C supports arguments -Werror=missing-braces: YES
| Compiler for C supports arguments -Werror=nonnull: YES
| Compiler for C supports arguments -Werror=pointer-to-int-cast: YES
| Compiler for C supports arguments -Werror=return-type: YES
| Compiler for C supports arguments -Werror=sequence-point: YES
| Compiler for C supports arguments -Werror=trigraphs: YES
| Compiler for C supports arguments -Werror=write-strings: YES
| Compiler for C supports arguments -fno-builtin-malloc: YES
| Compiler for C supports arguments -fno-builtin-calloc: YES
| Compiler for C supports arguments -D_LARGEFILE64_SOURCE=1: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/recipe-sysroot-native/usr/bin/pkg-config) 2.5.1
| Run-time dependency libdrm found: YES 2.4.133
| Run-time dependency libdrm_intel found: YES 2.4.133
| Run-time dependency libdrm_nouveau found: YES 2.4.133
| Run-time dependency libdrm_amdgpu found: YES 2.4.133
| Run-time dependency pciaccess found: YES 0.19
| Run-time dependency libkmod found: YES 34.2
| Found CMake: NO
| Run-time dependency libprocps found: NO  (tried pkg-config and cmake)
| Run-time dependency libproc2 found: YES 4.0.6-dirty
| Run-time dependency libunwind found: YES 1.8.3
| Run-time dependency libdw found: YES 0.194
| Run-time dependency pixman-1 found: YES 0.46.4
| Run-time dependency valgrind found: NO  (tried pkg-config)
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency libpci found: NO  (tried pkg-config)
| 
| ../sources/igt-gpu-tools-2.4/meson.build:165:9: ERROR: Dependency "libpci" not found (tried pkg-config)
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Package libpci was not found in the pkg-config search path.
| Perhaps you should add the directory containing `libpci.pc'
| to the PKG_CONFIG_PATH environment variable
| Package 'libpci' not found
| -----------
| CMake binary for host machine is cached as not found
| Dependency lookup for libpci with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
| Run-time dependency libpci found: NO  (tried pkg-config)
| 
| ../sources/igt-gpu-tools-2.4/meson.build:165:9: ERROR: Dependency "libpci" not found (tried pkg-config)
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.2017981:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.2017981, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.2017981, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.2017981, line 146
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.2017981, line 183
NOTE: recipe igt-gpu-tools-2.4-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2501 tasks of which 2492 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611121514.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611121514.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/log.do_configure.2017981
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-2.4-r0 do_configure: meson setup failed
ERROR: igt-gpu-tools-2.4-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/run.do_configure.2017981' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.4/temp/log.do_configure.2017981
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.4.bb:do_configure) failed with exit code '1'

--===============0369830057981190676==--

