Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221B7CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:18:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123077.1781500724075813033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PV09Zkgr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D897ZTSr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ec9b7be93-5e869853-0242-48ea-b638-ea0415c4bf4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781500723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U5Vrlzev9Ra/zoDvzI3TbkoM2k4WD0AE5Ll18lhkoBE=;
	b=PV09Zkgr5ykVGlhmBKKdsFu/3z7yBxOVy8EYgotPKe8kuE7s6vT97rCxBXDy7Q4w
	bziQidXCMIKE69EoPHHcaG5v1JEyJiUmgPyfmOQp/sE7/urrcD2ZSu62l84E2kCKDD/
	ThnuvmpPLNIY0ObRfa5aSEAL89KJTDjj153Q74bg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781500723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U5Vrlzev9Ra/zoDvzI3TbkoM2k4WD0AE5Ll18lhkoBE=;
	b=D897ZTSrIUwYMEiuYHwFMsnN2imo42GaErASeFCt3pAlOYanOjNP7V4ZhULXoJKw
	8Cl+FMzlwvU301fokP80b8te3+AU0dU+b17mcA9ZkW7n7P6ptsWiW7TIJ+sN8taSiZI
	2YggNb1I3o2P+ID+yuX3qBAkaxdTn1mTN/8rT0Es=
Content-Type: multipart/mixed; boundary="===============8447776158055681090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] waffle: upgrading to 1.8.2 FAILED
Message-ID: <0101019ec9b7be93-5e869853-0242-48ea-b638-ea0415c4bf4f-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jun 2026 05:18:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238805

--===============8447776158055681090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *waffle* to *1.8.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-waffle-upgrade-1.8.1-1.8.2.patch
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
From aeb3ace605718e3e1d3b735ad8d9976bdc5164b8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jun 2026 05:11:58 +0000
Subject: [PATCH] waffle: upgrade 1.8.1 -> 1.8.2

---
 .../waffle/{waffle_1.8.1.bb => waffle_1.8.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/waffle/{waffle_1.8.1.bb => waffle_1.8.2.bb} (97%)

diff --git a/meta/recipes-graphics/waffle/waffle_1.8.1.bb b/meta/recipes-graphics/waffle/waffle_1.8.2.bb
similarity index 97%
rename from meta/recipes-graphics/waffle/waffle_1.8.1.bb
rename to meta/recipes-graphics/waffle/waffle_1.8.2.bb
index 5d993cf254..074485366c 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
 SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.8 \
            file://0001-c11-threads-fix-build-on-c23.patch \
            "
-SRCREV = "49abc7cb5f73cc6852136c91da49ea3a338960e4"
+SRCREV = "70dd251e0390401ab9dc4f768ee9665863f4c268"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-- 
2.47.1


--===============8447776158055681090==
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
DISTRO_VERSION       = "6.0.99+snapshot-8a48794fb7290b17ef842ec831f877ff0be47f0a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:8a48794fb7290b17ef842ec831f877ff0be47f0a"
meta-yocto-bsp       
meta-poky            = "master:f49de2f33e37ca971d64215cc1a3669312e1e7c3"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 736 Local 723 Mirrors 0 Missed 13 Current 398 (98% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 515 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 574 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 578 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 754 of 1134 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 930 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_recipe_qa)
NOTE: Running task 932 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_write_config)
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe waffle-1.8.2-r0: task do_recipe_qa: Started
NOTE: recipe waffle-1.8.2-r0: task do_write_config: Started
NOTE: recipe mesa-2_26.0.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 975 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 990 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.133.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1009 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1020 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe waffle-1.8.2-r0: task do_write_config: Succeeded
NOTE: recipe wayland-native-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1134 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1100 of 1134 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.133-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1103 of 1134 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-native-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1104 of 1134 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.25.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-native-1.25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe waffle-1.8.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 962 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_fetch)
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1134 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe waffle-1.8.2-r0: task do_fetch: Started
NOTE: recipe wayland-native-1.25.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe waffle-1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2408 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_unpack)
NOTE: Running task 2509 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2655 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_create_recipe_spdx)
NOTE: recipe waffle-1.8.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe waffle-1.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe waffle-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2660 of 2675 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_patch)
NOTE: recipe waffle-1.8.2-r0: task do_patch: Started
NOTE: recipe waffle-1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.8.2-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2660 tasks of which 2653 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260615051143.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260615051143.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/waffle/1.8.2/temp/log.do_patch.1415068
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: waffle-1.8.2-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-build-on-c23.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/waffle/1.8.2/sources/waffle-1.8.2'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/waffle/1.8.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-c11-threads-fix-build-on-c23.patch
patching file third_party/threads/threads.h
Hunk #1 FAILED at 102.
1 out of 1 hunk FAILED -- rejects in file third_party/threads/threads.h
patching file third_party/threads/threads_posix.c
Hunk #1 FAILED at 75.
1 out of 1 hunk FAILED -- rejects in file third_party/threads/threads_posix.c
Patch 0001-c11-threads-fix-build-on-c23.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/waffle/1.8.2/temp/log.do_patch.1415068
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/waffle/waffle_1.8.2.bb:do_patch) failed with exit code '1'

--===============8447776158055681090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-waffle-upgrade-1.8.1-1.8.2.patch"

RnJvbSBhZWIzYWNlNjA1NzE4ZTNlMWQzYjczNWFkOGQ5OTc2YmRjNTE2NGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVuIDIwMjYgMDU6MTE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YWZmbGU6IHVwZ3JhZGUgMS44LjEgLT4gMS44LjIKCi0tLQogLi4uL3dhZmZsZS97d2FmZmxlXzEu
OC4xLmJiID0+IHdhZmZsZV8xLjguMi5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3dhZmZsZS97d2FmZmxlXzEuOC4xLmJiID0+IHdhZmZsZV8xLjguMi5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8x
LjguMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuOC4yLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZm
bGUvd2FmZmxlXzEuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxl
L3dhZmZsZV8xLjguMi5iYgppbmRleCA1ZDk5M2NmMjU0Li4wNzQ0ODUzNjZjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjguMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2FmZmxlL3dhZmZsZV8xLjguMi5iYgpAQCAtMTIsNyArMTIsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9NGM1MTU0NDA3YzI0
OTA3NTBkZDQ2MWM1MGFkOTQ3OTcgXAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL21lc2Evd2FmZmxlLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbnQtMS44IFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtYzExLXRocmVhZHMtZml4LWJ1aWxkLW9uLWMyMy5wYXRj
aCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI0OWFiYzdjYjVmNzNjYzY4NTIxMzZjOTFkYTQ5
ZWEzYTMzODk2MGU0IgorU1JDUkVWID0gIjcwZGQyNTFlMDM5MDQwMWFiOWRjNGY3NjhlZTk2NjU4
NjNmNGMyNjgiCiAKIGluaGVyaXQgbWVzb24gZmVhdHVyZXNfY2hlY2sgbGliX3BhY2thZ2UgYmFz
aC1jb21wbGV0aW9uIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============8447776158055681090==--

