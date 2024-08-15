Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A54BC54749
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.131110.1723748335344192552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YPEdZtNF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JObWLSDT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019157683cee-50f51de3-76b9-41fd-98b3-45a735b4f828-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=krwAaHt0d5BTB12Vb3XbW+Tur0UDSrDDId3l3BeVna8=;
	b=YPEdZtNFGQB84PunuIdzxqvFhHjHsHBv3HoqMDLIzZ8ENPrGtM1UE3R6el8P/4jh
	dJ7ybL52uElC1MVX2vH4EbKQwKGYMlbnOEZBPBXJzApDrjy/uytVGTLGG15L5b+Ujr1
	hFbsJnRMslXJ3qqPKmyE6XJT54EwNEvtpAwm3o04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=krwAaHt0d5BTB12Vb3XbW+Tur0UDSrDDId3l3BeVna8=;
	b=JObWLSDT4o6CVAaOeZGitbe9VnHyFWt5IHqh0RRVAAzCK0TCAbwdSP6x38PTDnTR
	PXUlSqr2+4Ty6jRKlP0Zbbs0ge3fAGHYE8LaqTcEHBZfK8pqq4U/VHkZGA3L7gYN/kb
	ZgAq4ozpXmFuEX9HVE2YBIsjitOJVnXTqe0qlzpw=
Content-Type: multipart/mixed; boundary="===============1635822216542307833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hicolor-icon-theme: upgrading to 0.18 FAILED
Message-ID: <0101019157683cee-50f51de3-76b9-41fd-98b3-45a735b4f828-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203409

--===============1635822216542307833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hicolor-icon-theme* to *0.18* has Failed(do_compile).

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
From b96e917c4d4bd34957396166bafbca5c5bd38d20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 14:54:04 +0000
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


--===============1635822216542307833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hicolor-icon-theme-upgrade-0.17-0.18.patch"

RnJvbSBiOTZlOTE3YzRkNGJkMzQ5NTczOTYxNjZiYWZiY2E1YzViZDM4ZDIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTQ6NTQ6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
aWNvbG9yLWljb24tdGhlbWU6IHVwZ3JhZGUgMC4xNyAtPiAwLjE4CgotLS0KIC4uLi97aGljb2xv
ci1pY29uLXRoZW1lXzAuMTcuYmIgPT4gaGljb2xvci1pY29uLXRoZW1lXzAuMTguYmJ9IHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ25vbWUvaGljb2xvci1pY29uLXRoZW1lL3toaWNvbG9yLWljb24tdGhl
bWVfMC4xNy5iYiA9PiBoaWNvbG9yLWljb24tdGhlbWVfMC4xOC5iYn0gKDgwJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvaGljb2xvci1pY29uLXRoZW1lL2hpY29sb3ItaWNvbi10
aGVtZV8wLjE3LmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2hpY29sb3ItaWNvbi10aGVtZS9oaWNv
bG9yLWljb24tdGhlbWVfMC4xOC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ25vbWUvaGljb2xvci1pY29uLXRoZW1lL2hpY29sb3ItaWNvbi10aGVtZV8w
LjE3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvaGljb2xvci1pY29uLXRoZW1lL2hp
Y29sb3ItaWNvbi10aGVtZV8wLjE4LmJiCmluZGV4IGJiNmNiMDAwYWIuLjBjYmQwMDU0NGIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9oaWNvbG9yLWljb24tdGhlbWUvaGljb2xvci1p
Y29uLXRoZW1lXzAuMTcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2hpY29sb3ItaWNvbi10
aGVtZS9oaWNvbG9yLWljb24tdGhlbWVfMC4xOC5iYgpAQCAtOCw4ICs4LDcgQEAgTElDRU5TRSA9
ICJHUEwtMi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1m
MDhhNDQ2ODA5OTEzZmM5YjNjNzE4ZjBlYWVhMDQyNiIKIAogU1JDX1VSSSA9ICJodHRwczovL2lj
b24tdGhlbWUuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50YXIueHoiCi1T
UkNfVVJJW21kNXN1bV0gPSAiODRlZWM4ZDZmODEwMjQwYTA2OWM3MzFmMTg3MGI0NzQiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMzE3NDg0MzUyMjcxZDE4Y2JiY2ZhYzM4NjhlYWI3OThkNjdmZmYx
Yjg0MDJlNzQwYmFhNmZmNDFkNTg4YTlkOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkYjBlNTBh
ODBhYTNiZjY0YmI0NWNiY2E1Y2Y5Zjc1ZWZkOTM0OGNmMmFjNjkwYjkwNzQzNTIzOGMzY2Y4MWQ3
IgogCiBpbmhlcml0IGFsbGFyY2ggYXV0b3Rvb2xzCiAKLS0gCjIuNDQuMAoK

--===============1635822216542307833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-330f8e8fa347113675de4806f2a76b53212cb039"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:330f8e8fa347113675de4806f2a76b53212cb039"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 62 Local 51 Mirrors 0 Missed 11 Current 158 (82% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 173 of 220 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
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
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_patch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_patch: Succeeded
NOTE: Running task 693 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 694 of 707 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_lic)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_populate_lic: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_lic unihash changed to d8e960b4ed3c6452e9b2b86c9f6287d08a7cdb7d39a03b562f97df3a90860981
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_deploy_source_date_epoch unihash changed to c2cd0744b585ddaf2495178bf59f989a682e997f6585965beca45cadf72da9b9
NOTE: Setscene tasks completed
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820, line 195
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 696 tasks of which 687 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815145351.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815145351.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: hicolor-icon-theme-0.18-r0 do_compile: oe_runmake failed
ERROR: hicolor-icon-theme-0.18-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/run.do_compile.1693820', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/hicolor-icon-theme/0.18/temp/log.do_compile.1693820
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_compile) failed with exit code '1'

--===============1635822216542307833==--

