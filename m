Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ABBC36007
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.115402.1726410841828367318
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZAlJm+AT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XnnFvvNX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61adc04-2c9d97d3-3a5e-48bd-80ff-ca47fda72bb9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l0Y0x2396BtPztrRA3w5uQozTEeOOfY064isCk4HDN4=;
	b=ZAlJm+AT4OYawEb/bqV+6GGpjGFROiOTrqjPrJeGM2AOC8sPGmBrwUeCv5yVsm1Y
	S8zh4DoNq48fl19jXii+/rQS+/qAoJ6cwnv0z0S1ItlQuF5msPQH5zz3lPNchJOViJA
	4NUe/53LxqdIfCevJ/VSXUyzrUNuzT6nN26g34bk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l0Y0x2396BtPztrRA3w5uQozTEeOOfY064isCk4HDN4=;
	b=XnnFvvNXki6OuERx0pfdLgwj0CWvjYSgCJ6OWwyzOKTMzZO/cxsKIrP4bi7LKIRa
	l0EPCVheixtSrU/WX25VlrQM+U+d4xfjg8PLvcYcIzLSgqQVf8i7SPkO13IdltZyyZx
	191FkaCpVfOLeRizEQmIw/nyrpgkGEGVzfMjGHA0=
Content-Type: multipart/mixed; boundary="===============3523004092386383167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libportal: upgrading to 0.8.1 FAILED
Message-ID: <01010191f61adc04-2c9d97d3-3a5e-48bd-80ff-ca47fda72bb9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204563

--===============3523004092386383167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libportal* to *0.8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libportal-upgrade-0.7.1-0.8.1.patch
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
From ffbe406b392f7d4190779fb1ffbba41311d83fb8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 11:15:49 +0000
Subject: [PATCH] libportal: upgrade 0.7.1 -> 0.8.1

---
 .../libportal/{libportal_0.7.1.bb => libportal_0.8.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.7.1.bb => libportal_0.8.1.bb} (95%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.7.1.bb b/meta/recipes-gnome/libportal/libportal_0.8.1.bb
similarity index 95%
rename from meta/recipes-gnome/libportal/libportal_0.7.1.bb
rename to meta/recipes-gnome/libportal/libportal_0.8.1.bb
index 6ddfef76d3..0096335070 100644
--- a/meta/recipes-gnome/libportal/libportal_0.7.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.8.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main \
            file://0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch"
-SRCREV = "e9ed3a50cdde321eaf42361212480a66eb94a57a"
+SRCREV = "26c15008cbe579f57f89468384f8efc033f25f6f"
 S = "${WORKDIR}/git"
 
 inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
-- 
2.44.0


--===============3523004092386383167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-491b0474a57a1f2c8e7f41d653f4aef60b4cdd28"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:491b0474a57a1f2c8e7f41d653f4aef60b4cdd28"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 538 Local 525 Mirrors 0 Missed 13 Current 736 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 776 of 1274 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1181 of 1274 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3148 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_recipe_qa)
NOTE: Running task 3301 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_write_config)
NOTE: recipe libportal-0.8.1-r0: task do_recipe_qa: Started
NOTE: recipe libportal-0.8.1-r0: task do_write_config: Started
NOTE: recipe libportal-0.8.1-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.8.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3462 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_fetch)
NOTE: recipe libportal-0.8.1-r0: task do_fetch: Started
NOTE: recipe libportal-0.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 3463 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_unpack)
NOTE: Running task 3464 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libportal-0.8.1-r0: task do_unpack: Started
NOTE: recipe libportal-0.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 3465 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_patch)
NOTE: Running task 3466 of 3481 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libportal-0.8.1-r0: task do_patch: Started
NOTE: recipe libportal-0.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libportal-0.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.8.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 3466 tasks of which 3459 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915111532.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915111532.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libportal/0.8.1/temp/log.do_patch.2627579
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libportal-0.8.1-r0 do_patch: Applying patch '0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libportal/0.8.1/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libportal/0.8.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch
patching file libportal/meson.build
Hunk #1 FAILED at 168.
Hunk #2 FAILED at 227.
2 out of 2 hunks FAILED -- rejects in file libportal/meson.build
Patch 0001-meson.build-fix-build-race-when-building-GTK-vapi-fi.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libportal/0.8.1/temp/log.do_patch.2627579
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.8.1.bb:do_patch) failed with exit code '1'

--===============3523004092386383167==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libportal-upgrade-0.7.1-0.8.1.patch"

RnJvbSBmZmJlNDA2YjM5MmY3ZDQxOTA3NzlmYjFmZmJiYTQxMzExZDgzZmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTE6MTU6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwb3J0YWw6IHVwZ3JhZGUgMC43LjEgLT4gMC44LjEKCi0tLQogLi4uL2xpYnBvcnRhbC97bGli
cG9ydGFsXzAuNy4xLmJiID0+IGxpYnBvcnRhbF8wLjguMS5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdub21lL2xpYnBvcnRhbC97bGlicG9ydGFsXzAuNy4xLmJiID0+IGxpYnBvcnRhbF8w
LjguMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFs
L2xpYnBvcnRhbF8wLjcuMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJwb3J0YWwvbGlicG9y
dGFsXzAuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1nbm9tZS9saWJwb3J0YWwvbGlicG9ydGFsXzAuNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBvcnRhbF8wLjguMS5iYgppbmRleCA2ZGRmZWY3NmQzLi4w
MDk2MzM1MDcwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBv
cnRhbF8wLjcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlicG9ydGFsL2xpYnBvcnRh
bF8wLjguMS5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9MzAwMDIwOGQ1MzllYzA2MWI4OTliY2UxZDljZTk0MDQiCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9mbGF0cGFrLyR7QlBOfS5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1maXgtYnVpbGQtcmFj
ZS13aGVuLWJ1aWxkaW5nLUdUSy12YXBpLWZpLnBhdGNoIgotU1JDUkVWID0gImU5ZWQzYTUwY2Rk
ZTMyMWVhZjQyMzYxMjEyNDgwYTY2ZWI5NGE1N2EiCitTUkNSRVYgPSAiMjZjMTUwMDhjYmU1Nzlm
NTdmODk0NjgzODRmOGVmYzAzM2YyNWY2ZiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVy
aXQgbWVzb24gZ2ktZG9jZ2VuIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGZlYXR1cmVzX2No
ZWNrIHBrZ2NvbmZpZwotLSAKMi40NC4wCgo=

--===============3523004092386383167==--

