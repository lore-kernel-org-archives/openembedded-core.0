Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD531C0218F
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.42715.1738416048586333496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NMsPgANK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YThgPFdw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194c1abc673-a23d4749-d9b7-4165-986f-39978af23cff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1NbWW5NkXS4kRNf+5qYAkIr1Lsph79kHOT9T+AjacF4=;
	b=NMsPgANKcyfKqXwUFH/uNij03DM+evA2kCMKKnRa3oGAviw2dxibBtPozEbX2mdz
	gSoBV2hEHd38yAF3/XAFy5mi4qis/p7smFYdp8stiXWppDFbZCkVX77+d1D0z54fpS5
	JEaNtrFHEYS7apglnwpfMSED6p+AbrbDsL6tRro8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1NbWW5NkXS4kRNf+5qYAkIr1Lsph79kHOT9T+AjacF4=;
	b=YThgPFdwN3T8zcaLkjXT3ZEdZEGDggn+oP/O6fe9BBHQoTL8l+R9DcgN/BljbnaU
	FOHKdKoA4HOiTFNDNbqfuuOrKt2SBVfwVOFtdByVTHGDAgKrqsfoLf9NajILZz1iBr/
	oM4ffLGOi7mExhLJSTKkXokpNEqcY7uIqkLnfHaw=
Content-Type: multipart/mixed; boundary="===============4838053859719945254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.1.3 FAILED
Message-ID: <01010194c1abc673-a23d4749-d9b7-4165-986f-39978af23cff-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210523

--===============4838053859719945254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *11.1.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-fmt-upgrade-11.1.1-11.1.3.patch
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
From 20eb5bbab8140000b0e1ccdaa540bdaf5def4939 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 07:12:31 +0000
Subject: [PATCH] fmt: upgrade 11.1.1 -> 11.1.3

---
 meta/recipes-devtools/fmt/{fmt_11.1.1.bb => fmt_11.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fmt/{fmt_11.1.1.bb => fmt_11.1.3.bb} (91%)

diff --git a/meta/recipes-devtools/fmt/fmt_11.1.1.bb b/meta/recipes-devtools/fmt/fmt_11.1.3.bb
similarity index 91%
rename from meta/recipes-devtools/fmt/fmt_11.1.1.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.3.bb
index cfacd81a11..179e2a4ea4 100644
--- a/meta/recipes-devtools/fmt/fmt_11.1.1.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
            file://fix-gcc9.patch"
-SRCREV = "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
+SRCREV = "9cf9f38eded63e5e0fb95cd536ba51be601d7fa2"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============4838053859719945254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-11.1.1-11.1.3.patch"

RnJvbSAyMGViNWJiYWI4MTQwMDAwYjBlMWNjZGFhNTQwYmRhZjVkZWY0OTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNzoxMjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZt
dDogdXBncmFkZSAxMS4xLjEgLT4gMTEuMS4zCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9m
bXQve2ZtdF8xMS4xLjEuYmIgPT4gZm10XzExLjEuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZm10L3tmbXRfMTEuMS4xLmJiID0+IGZtdF8xMS4xLjMuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4xLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4zLmJiCmluZGV4IGNmYWNkODFhMTEu
LjE3OWUyYTRlYTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzEx
LjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMS4xLjMuYmIKQEAg
LTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWI5MjU3
Nzg1ZmM0ZjM4MDNhNGI3MWI3NmMxNDEyNzI5IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vZm10bGliL2ZtdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAg
ZmlsZTovL2ZpeC1nY2M5LnBhdGNoIgotU1JDUkVWID0gImUzZGRlZGU2YzRlZTgxODgyNWM0ZTVh
NmRmYTFkMzg0ODYwYzI3ZDkiCitTUkNSRVYgPSAiOWNmOWYzOGVkZWQ2M2U1ZTBmYjk1Y2Q1MzZi
YTUxYmU2MDFkN2ZhMiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============4838053859719945254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9ed6477904efb465914db751e948e1ca4bc8751e"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 82 Local 70 Mirrors 0 Missed 12 Current 223 (85% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 779 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_recipe_qa)
NOTE: recipe fmt-11.1.3-r0: task do_recipe_qa: Started
NOTE: recipe fmt-11.1.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 899 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_fetch)
NOTE: recipe fmt-11.1.3-r0: task do_fetch: Started
NOTE: recipe fmt-11.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_unpack)
NOTE: Running task 901 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe fmt-11.1.3-r0: task do_unpack: Started
NOTE: recipe fmt-11.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fmt-11.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fmt-11.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_patch)
NOTE: Running task 903 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_collect_spdx_deps)
NOTE: recipe fmt-11.1.3-r0: task do_patch: Started
NOTE: recipe fmt-11.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fmt-11.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fmt-11.1.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 903 tasks of which 897 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201071219.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201071219.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/temp/log.do_patch.2972480
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: fmt-11.1.3-r0 do_patch: Applying patch 'fix-gcc9.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch fix-gcc9.patch
patching file include/fmt/format.h
Hunk #1 FAILED at 227.
1 out of 1 hunk FAILED -- rejects in file include/fmt/format.h
Patch fix-gcc9.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/temp/log.do_patch.2972480
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_patch) failed with exit code '1'

--===============4838053859719945254==--

