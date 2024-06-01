Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C0BC3271F
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.42225.1717263219264008729
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UmfHiLAY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=P1uoy0lt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018fd4dd376a-ae17b643-4b7a-4617-a768-dabef0dc81ee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PfxOzD2CmhxGQ5TEeOUNuxR1fVS9kox0bx+qPTBjqpM=;
	b=UmfHiLAYjSPn4CtpCHxA6sQzZoxlN1/hyN7fCwwc1kadeEDjQwUk7ddD+FgikjNc
	aZScGUnaXtTuq2JFa9cY+5x2/s+HoRG6icUukhGHRTkAIFW2oi7YWxkXECrQDQEf0gt
	q12FxkLq8b1eIDPkq7VeVB018ENBcsW/rgKheM0M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PfxOzD2CmhxGQ5TEeOUNuxR1fVS9kox0bx+qPTBjqpM=;
	b=P1uoy0ltA2Tn3FHSpY93s0LAd3zoVaD5UbwV9HZWWI5pF1oUMW0QwPe+uWsSWA4p
	U8vAR6WnkULHCGHJLXQZFWg5jX/kcdfL6U0/IrGshPTJxJ9Ju2DqWhlD6tXZjL7ablz
	gMaEZFjHyHVRZh2BRfVfQWtSbnf96Et2LyoIWIf0=
Content-Type: multipart/mixed; boundary="===============4804155614784881521=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hicolor-icon-theme: upgrading to 0.18 FAILED
Message-ID: <0101018fd4dd376a-ae17b643-4b7a-4617-a768-dabef0dc81ee-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200164

--===============4804155614784881521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hicolor-icon-theme* to *0.18* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-hicolor-icon-theme-upgrade-0.17-0.18.patch
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
From 6e88e3d5698767a0a24de6a61ba60c01b9350855 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 13:35:22 +0000
Subject: [PATCH] hicolor-icon-theme: upgrade 0.17 -> 0.18

---
 .../{hicolor-icon-theme_0.17.bb => hicolor-icon-theme_0.18.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.17.bb => hicolor-icon-theme_0.18.bb} (80%)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb
similarity index 80%
rename from meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
rename to meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb
index bb6cb000ab..0cbd00544b 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb
@@ -8,8 +8,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SRC_URI = "https://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "84eec8d6f810240a069c731f1870b474"
-SRC_URI[sha256sum] = "317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8"
+SRC_URI[sha256sum] = "db0e50a80aa3bf64bb45cbca5cf9f75efd9348cf2ac690b907435238c3cf81d7"
 
 inherit allarch autotools
 
-- 
2.44.0


--===============4804155614784881521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-3fd53263590f41b5856bf88d33f027015ccc82e8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3fd53263590f41b5856bf88d33f027015ccc82e8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 67 Local 55 Mirrors 0 Missed 12 Current 153 (82% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 450 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_recipe_qa)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_recipe_qa: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_recipe_qa: Succeeded
NOTE: Running task 688 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_fetch)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_fetch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_unpack)
NOTE: Running task 690 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_unpack: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 691 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_patch)
NOTE: Running task 692 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_collect_spdx_deps)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_patch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_patch: Succeeded
NOTE: Running task 693 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 694 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_lic)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_populate_lic: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_populate_lic: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 695 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_configure)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_configure: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_configure: Succeeded
NOTE: Running task 696 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_compile)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'common-linux', 'common-glibc', 'allarch-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039, line 195
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 696 tasks of which 686 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240601133504.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240601133504.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: hicolor-icon-theme-0.18-r0 do_compile: oe_runmake failed
ERROR: hicolor-icon-theme-0.18-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.2030039', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/log.do_compile.2030039
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_compile) failed with exit code '1'

--===============4804155614784881521==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hicolor-icon-theme-upgrade-0.17-0.18.patch"

RnJvbSA2ZTg4ZTNkNTY5ODc2N2EwYTI0ZGU2YTYxYmE2MGMwMWI5MzUwODU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxMzozNToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhp
Y29sb3ItaWNvbi10aGVtZTogdXBncmFkZSAwLjE3IC0+IDAuMTgKCi0tLQogLi4uL3toaWNvbG9y
LWljb24tdGhlbWVfMC4xNy5iYiA9PiBoaWNvbG9yLWljb24tdGhlbWVfMC4xOC5iYn0gfCAzICst
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1nbm9tZS9oaWNvbG9yLWljb24tdGhlbWUve2hpY29sb3ItaWNvbi10aGVt
ZV8wLjE3LmJiID0+IGhpY29sb3ItaWNvbi10aGVtZV8wLjE4LmJifSAoODAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1nbm9tZS9oaWNvbG9yLWljb24tdGhlbWUvaGljb2xvci1pY29uLXRo
ZW1lXzAuMTcuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvaGljb2xvci1pY29uLXRoZW1lL2hpY29s
b3ItaWNvbi10aGVtZV8wLjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1nbm9tZS9oaWNvbG9yLWljb24tdGhlbWUvaGljb2xvci1pY29uLXRoZW1lXzAu
MTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9oaWNvbG9yLWljb24tdGhlbWUvaGlj
b2xvci1pY29uLXRoZW1lXzAuMTguYmIKaW5kZXggYmI2Y2IwMDBhYi4uMGNiZDAwNTQ0YiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2hpY29sb3ItaWNvbi10aGVtZS9oaWNvbG9yLWlj
b24tdGhlbWVfMC4xNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvaGljb2xvci1pY29uLXRo
ZW1lL2hpY29sb3ItaWNvbi10aGVtZV8wLjE4LmJiCkBAIC04LDggKzgsNyBAQCBMSUNFTlNFID0g
IkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWYw
OGE0NDY4MDk5MTNmYzliM2M3MThmMGVhZWEwNDI2IgogCiBTUkNfVVJJID0gImh0dHBzOi8vaWNv
bi10aGVtZS5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiIKLVNS
Q19VUklbbWQ1c3VtXSA9ICI4NGVlYzhkNmY4MTAyNDBhMDY5YzczMWYxODcwYjQ3NCIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzMTc0ODQzNTIyNzFkMThjYmJjZmFjMzg2OGVhYjc5OGQ2N2ZmZjFi
ODQwMmU3NDBiYWE2ZmY0MWQ1ODhhOWQ4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRiMGU1MGE4
MGFhM2JmNjRiYjQ1Y2JjYTVjZjlmNzVlZmQ5MzQ4Y2YyYWM2OTBiOTA3NDM1MjM4YzNjZjgxZDci
CiAKIGluaGVyaXQgYWxsYXJjaCBhdXRvdG9vbHMKIAotLSAKMi40NC4wCgo=

--===============4804155614784881521==--

