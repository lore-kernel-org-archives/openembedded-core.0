Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA87CD98CA
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1580.1780328146928067376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=umrn8kJk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qdb4Pj1t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3b55e-92dc790c-bf31-4222-ab58-42c4f96081ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JwIodKZc/8lfxGMzGLTrcwRVnU0Oa/VA7caGemmDpY8=;
	b=umrn8kJk06nwpLdf8VxUciCHiivaRmxgnuQDlD8yXqQMssZlJnSRvniSF48Gq4mx
	wgvDfegqBObMQ5MfEkRTuySG/OTPVBzNW/VxKq5z3xrJcCqkDFXWxwK1VpzxtAMkYGA
	jitl3CtxHlSTKze8s2iJW4DnYSIBGSQs3M2yEyT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JwIodKZc/8lfxGMzGLTrcwRVnU0Oa/VA7caGemmDpY8=;
	b=qdb4Pj1tVYnMQ8MV4NMfad8MVRtc4ifn3V6xYkpkTjq6sLOo4bcrHG2NX6yYQ1BM
	2Ve+rk30RclExaRY7eid2/LQsakY4OgXhZw7ahmjaGqFUs9LwWlvND178fNl441fC0w
	CaE+TAH/BIa4YmKQlF8iMZxY+TPFkgQ3tY+umYlI=
Content-Type: multipart/mixed; boundary="===============1561410767626003682=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.4.350.0 FAILED
Message-ID: <0101019e83d3b55e-92dc790c-bf31-4222-ab58-42c4f96081ba-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237926

--===============1561410767626003682==
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
From b3af835d0843ae56f5cf194c2757656c249c7298 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:37:27 +0000
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


--===============1561410767626003682==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSBiM2FmODM1ZDA4NDNhZTU2ZjVjZjE5NGMyNzU3NjU2YzI0OWM3Mjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMTozNzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LXRvb2xzOiB1cGdyYWRlIDEuNC4zNDEuMCAtPiAxLjQuMzUwLjAKCi0tLQogLi4uL3NwaXIv
e3NwaXJ2LXRvb2xzXzEuNC4zNDEuMC5iYiA9PiBzcGlydi10b29sc18xLjQuMzUwLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LXRvb2xzXzEuNC4zNDEuMC5iYiA9
PiBzcGlydi10b29sc18xLjQuMzUwLjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM0MS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjM1MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEu
NC4zNDEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9v
bHNfMS40LjM1MC4wLmJiCmluZGV4IDVlNzE2N2ViZTguLmJkZGU4YzZkYjkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zNDEuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjQuMzUwLjAuYmIKQEAg
LTcsNyArNyw3IEBAIFNFQ1RJT04gPSAiZ3JhcGhpY3MiCiBMSUNFTlNFICA9ICJBcGFjaGUtMi4w
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2
NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ1JFViA9ICJmYmU0ZjNhZDkxM2M0NGZlODcwMDU0NWY4
ZmZlMzVkMTM4MmI3MDkzIgorU1JDUkVWID0gIjA1MzljODFmNjlhM2RhZWI3MDZmZDM0NzdkY2E2
MTQzNWI0NzUxNTYiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQ
SVJWLVRvb2xzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwczt0YWc9dnVsa2FuLXNkay0k
e1BWfSBcCiAgICAgZmlsZTovLzAwMDEtb3B0LUZpeC1idWlsZC1pc3N1ZS13aXRoLWdjYy0xNi1y
ZXBsYWVjZXMtUFItNjU0Mi02NS5wYXRjaCBcCiAiCi0tIAoyLjQ3LjEKCg==

--===============1561410767626003682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-b4a1b9b415b92301f8951c2881dc5c0841b0b8f7"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b4a1b9b415b92301f8951c2881dc5c0841b0b8f7"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 92 Local 80 Mirrors 0 Missed 12 Current 337 (86% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 428 of 429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_recipe_qa_setscene)
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
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601113715.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601113715.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/temp/log.do_patch.3457974
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: spirv-tools-1_1.4.350.0-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/sources/spirv-tools-1.4.350.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
patching file source/opt/decoration_manager.cpp
Hunk #1 FAILED at 543.
1 out of 1 hunk FAILED -- rejects in file source/opt/decoration_manager.cpp
Patch 0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/spirv-tools/1.4.350.0/temp/log.do_patch.3457974
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.350.0.bb:do_patch) failed with exit code '1'

--===============1561410767626003682==--

