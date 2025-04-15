Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ADAC3ABBA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20164.1744723971462386219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=V4BtumRw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EIHq0hov;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019639a75abb-21ee7393-48d8-41d9-9543-205a86a935dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oOK4sLdiDfFMZbUSeXdqhJsLUfA3kmlZHgAtCxjgZFc=;
	b=V4BtumRwcR9yz82uFZn3vQ5vdkXCAKAnrTwB7/0DR7zWn69Zx65VfohnJLq5ED6t
	JwxxSEhdLXG3Rio8TJrWoVrTnuPwswSaXw7KDwGVz9MDn3ge+ahPFPkzBSMlk8VWNSL
	AALs+nbt5oOH2jNXLeEN6gL1k291lWUDKSmkQHmU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oOK4sLdiDfFMZbUSeXdqhJsLUfA3kmlZHgAtCxjgZFc=;
	b=EIHq0hov+LaAzK0MxjJnaj6yuC6TiCfNA8xdMtPXOKeVZ2WRurcAiy8XfcMR5qoJ
	+2tT7Y3jSN2RnxgI7ig6MKNSbdQrB8B7EjvVYM/tflpHlw4JiUSSgd8Gz+kjzDBMdyD
	r4deKMAiuTDvA3J2CiKP38Ujm46qyC1aPTNdj9Dw=
Content-Type: multipart/mixed; boundary="===============1627072845293287664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bmaptool: upgrading to 3.9.0 FAILED
Message-ID: <0101019639a75abb-21ee7393-48d8-41d9-9543-205a86a935dc-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214929

--===============1627072845293287664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bmaptool* to *3.9.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bmaptool-upgrade-3.8.0-3.9.0.patch
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
From 36aa49cd83bbb9c1d42d8cd6d4278530944925c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 12:15:10 +0000
Subject: [PATCH] bmaptool: upgrade 3.8.0 -> 3.9.0

---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
index c38f05e1a1..ec5e99916b 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -10,10 +10,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
-SRCREV = "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
+SRCREV = "618a7316102f6f81faa60537503012a419eafa06"
 S = "${WORKDIR}/git"
 BASEVER = "3.8.0"
-PV = "${BASEVER}+git"
+PV = "3.9.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============1627072845293287664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1898 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7cc180a5abae60c02e0f6b1a0446e340e9dc0741"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 317 Local 305 Mirrors 0 Missed 12 Current 396 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1544 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_recipe_qa)
NOTE: recipe bmaptool-3.9.0-r0: task do_recipe_qa: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_recipe_qa unihash changed to 01e20cdda0b2f11fde4bd4c729b466625b8957e8aa9941dd53c82a6a079a4f93
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_populate_lic became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_deploy_source_date_epoch became valid
NOTE: Running setscene task 708 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 713 of 713 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bmaptool-3.9.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1984 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_fetch)
NOTE: recipe bmaptool-3.9.0-r0: task do_fetch: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_unpack)
NOTE: Running task 1986 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe bmaptool-3.9.0-r0: task do_unpack: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1987 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_patch)
NOTE: Running task 1988 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_collect_spdx_deps)
NOTE: recipe bmaptool-3.9.0-r0: task do_patch: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1990 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_check_backend)
NOTE: recipe bmaptool-3.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bmaptool-3.9.0-r0: task do_check_backend: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_check_backend: Succeeded
NOTE: Running task 1992 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_configure)
NOTE: recipe bmaptool-3.9.0-r0: task do_configure: Started
NOTE: recipe bmaptool-3.9.0-r0: task do_configure: Succeeded
NOTE: Running task 1993 of 2004 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_compile)
NOTE: recipe bmaptool-3.9.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/git/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2552480:181 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2552480, line 181
| 	#2: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2552480, line 171
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2552480, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2552480, line 185
NOTE: recipe bmaptool-3.9.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1993 tasks of which 1984 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415121456.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415121456.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/log.do_compile.2552480
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: bmaptool-3.9.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: bmaptool-3.9.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/run.do_compile.2552480' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/bmaptool/3.9.0/temp/log.do_compile.2552480
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bmaptool/bmaptool_git.bb:do_compile) failed with exit code '1'

--===============1627072845293287664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bmaptool-upgrade-3.8.0-3.9.0.patch"

RnJvbSAzNmFhNDljZDgzYmJiOWMxZDQyZDhjZDZkNDI3ODUzMDk0NDkyNWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMTI6MTU6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
bWFwdG9vbDogdXBncmFkZSAzLjguMCAtPiAzLjkuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9ibWFwdG9vbC9ibWFwdG9vbF9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvYm1hcHRvb2wvYm1hcHRvb2xfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm1h
cHRvb2wvYm1hcHRvb2xfZ2l0LmJiCmluZGV4IGMzOGYwNWUxYTEuLmVjNWU5OTkxNmIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2JtYXB0b29sL2JtYXB0b29sX2dpdC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ibWFwdG9vbC9ibWFwdG9vbF9naXQuYmIKQEAgLTEwLDEw
ICsxMCwxMCBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20veW9jdG9wcm9qZWN0LyR7QlBOfTticmFuY2g9bWFp
bjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICIyZmY1NzUwYjhhM2UwYjM2YTk5OTNjMjBlMmVh
MTBhMDdiYzYyMDg1IgorU1JDUkVWID0gIjYxOGE3MzE2MTAyZjZmODFmYWE2MDUzNzUwMzAxMmE0
MTllYWZhMDYiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogQkFTRVZFUiA9ICIzLjguMCIKLVBWID0g
IiR7QkFTRVZFUn0rZ2l0IgorUFYgPSAiMy45LjAiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JF
R0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKLS0gCjIuNDcuMQoK

--===============1627072845293287664==--

