Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29536CD98DB
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50605.1781195496442115901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oEWEkzaA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0wLtD27t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb786aa40-cda8fe8d-6e18-4c89-ab99-d69563bf01a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZcNPuZ96MdJkA9aOiP/oRcwwkgN3c/Uf6zEXDRx9JlM=;
	b=oEWEkzaAYGWQ2YddaWtaC631R2l6wHcjdWlBrYSIjYj5z4uYAKc2QscXT7x/vqFg
	fTKNwkz985vexeJUvGfgftGpUWbmB8Kktyig25NQ2duPE1pqPfAPHmroTflQBeVQ2+X
	IH5iwM6QlokxqvzY6lDfI73+Xd2rqdSpQ/mc8828=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZcNPuZ96MdJkA9aOiP/oRcwwkgN3c/Uf6zEXDRx9JlM=;
	b=0wLtD27t3AwrhV37eMoGv2T1y/XBzLCbqmIrPyA2LzmLFuKT2Gs964dscPkuk42Y
	ZnUDXW1LA6bcnpYdBBlAydun3mhUdgmILkkmAYdRr2dnA3Ob/zxliDFHblmkQSXHwPy
	8VyyetxqoA+WRyoYH0NnR3t2Q7Z4QF0O6z/rgh/I=
Content-Type: multipart/mixed; boundary="===============6951493248299143120=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.4.350.0 FAILED
Message-ID: <0101019eb786aa40-cda8fe8d-6e18-4c89-ab99-d69563bf01a0-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238538

--===============6951493248299143120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-tools* to *1.4.350.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.4.341.0-1.4.350.0.patch
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
From 145be42aadded3da64b57c9449b02d836a561be1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:30:02 +0000
Subject: [PATCH] spirv-tools: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../spir/{spirv-tools_1.4.341.0.bb => spirv-tools_1.4.350.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.341.0.bb => spirv-tools_1.4.350.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
index 5e7167ebe8..bdde8c6db9 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "fbe4f3ad913c44fe8700545f8ffe35d1382b7093"
+SRCREV = "0539c81f69a3daeb706fd3477dca61435b475156"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV} \
     file://0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch \
 "
-- 
2.47.1


--===============6951493248299143120==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSAxNDViZTQyYWFkZGVkM2RhNjRiNTdjOTQ0OWIwMmQ4MzZhNTYxYmUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6MzA6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjQuMzQxLjAgLT4gMS40LjM1MC4wCgotLS0KIC4uLi9zcGly
L3tzcGlydi10b29sc18xLjQuMzQxLjAuYmIgPT4gc3BpcnYtdG9vbHNfMS40LjM1MC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi10b29sc18xLjQuMzQxLjAuYmIg
PT4gc3BpcnYtdG9vbHNfMS40LjM1MC4wLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNDEuMC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18x
LjQuMzQxLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRv
b2xzXzEuNC4zNTAuMC5iYgppbmRleCA1ZTcxNjdlYmU4Li5iZGRlOGM2ZGI5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjQuMzQxLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM1MC4wLmJiCkBA
IC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImdyYXBoaWNzIgogTElDRU5TRSAgPSAiQXBhY2hlLTIu
MCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0
NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1TUkNSRVYgPSAiZmJlNGYzYWQ5MTNjNDRmZTg3MDA1NDVm
OGZmZTM1ZDEzODJiNzA5MyIKK1NSQ1JFViA9ICIwNTM5YzgxZjY5YTNkYWViNzA2ZmQzNDc3ZGNh
NjE0MzViNDc1MTU2IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9T
UElSVi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHM7dGFnPXZ1bGthbi1zZGst
JHtQVn0gXAogICAgIGZpbGU6Ly8wMDAxLW9wdC1GaXgtYnVpbGQtaXNzdWUtd2l0aC1nY2MtMTYt
cmVwbGFlY2VzLVBSLTY1NDItNjUucGF0Y2ggXAogIgotLSAKMi40Ny4xCgo=

--===============6951493248299143120==
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
DISTRO_VERSION       = "6.0.99+snapshot-e8e9c55af04bc5cad8071601dba643f21d11bc7d"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e8e9c55af04bc5cad8071601dba643f21d11bc7d"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 101 Local 89 Mirrors 0 Missed 12 Current 328 (88% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 426 of 429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1049 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1069 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_unpack)
NOTE: Running task 1071 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.4.350.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1072 tasks of which 1067 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611122948.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611122948.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/temp/log.do_patch.2083168
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: spirv-tools-1_1.4.350.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/sources/spirv-tools-1.4.350.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
patching file source/opt/decoration_manager.cpp
Hunk #1 FAILED at 543.
1 out of 1 hunk FAILED -- rejects in file source/opt/decoration_manager.cpp
Patch 0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/temp/log.do_patch.2083168
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_patch) failed with exit code '1'

--===============6951493248299143120==--

