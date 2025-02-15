Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53428C021B5
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8047.1739623326940396493
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JvkDLhoz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cyS811ML;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019509a184eb-047881bd-f4cd-41a2-813a-636b25f604ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EmZe8RZP8qJ2NxmIO9ZZ4iFHtsB/x8C78ekSx7FNO3k=;
	b=JvkDLhozqav7X0sKctw+J6QMQKIzBph7IrE6jk8S61XF0VO+tpetJOg9ZAhmDPEY
	O0UJG5QtlbqXReMtLdOEdbjtTew8oVlaOD35G0qGcwnPywYI8HJGZt/agsMby3YzWG5
	fmhjYk2kwiY0JAMXnO4S+y9HGIwXSk9m+XuojJ9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EmZe8RZP8qJ2NxmIO9ZZ4iFHtsB/x8C78ekSx7FNO3k=;
	b=cyS811MLEaGsvH7wlQpuH681VSIbtc8CA3eM+wxtwbOaLPEQjfROJHtjGHE9kN7S
	k2gBeid/CW7feP7z9yCaZbfHdRlpugpefwpUtHV2f+5OT7C/Yiw0q62NWN89YBJ/7UD
	hnTlcSz4hBzsjQblNTqA6LlpljNhff0jfNyyy0yY=
Content-Type: multipart/mixed; boundary="===============6352567761331651472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.1.3 FAILED
Message-ID: <0101019509a184eb-047881bd-f4cd-41a2-813a-636b25f604ca-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211414

--===============6352567761331651472==
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
From d48175cbf440eb0aec95c0cc745ef41ecf969012 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 07:18:59 +0000
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


--===============6352567761331651472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1869 targets, 38 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:a2a1ab5f2799712a5b93aa762a42bb2668043d31"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 98 Local 87 Mirrors 0 Missed 11 Current 207 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 301 of 305 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe fmt-11.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fmt-11.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
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
NOTE: Tasks Summary: Attempted 903 tasks of which 898 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215071847.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215071847.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/temp/log.do_patch.3512321
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: fmt-11.1.3-r0 do_patch: Applying patch 'fix-gcc9.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch fix-gcc9.patch
patching file include/fmt/format.h
Hunk #1 FAILED at 227.
1 out of 1 hunk FAILED -- rejects in file include/fmt/format.h
Patch fix-gcc9.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.3/temp/log.do_patch.3512321
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.3.bb:do_patch) failed with exit code '1'

--===============6352567761331651472==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-11.1.1-11.1.3.patch"

RnJvbSBkNDgxNzVjYmY0NDBlYjBhZWM5NWMwY2M3NDVlZjQxZWNmOTY5MDEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDc6MTg6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
bXQ6IHVwZ3JhZGUgMTEuMS4xIC0+IDExLjEuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Zm10L3tmbXRfMTEuMS4xLmJiID0+IGZtdF8xMS4xLjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2ZtdC97Zm10XzExLjEuMS5iYiA9PiBmbXRfMTEuMS4zLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMS4xLjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjEuMy5iYgppbmRleCBjZmFjZDgxYTEx
Li4xNzllMmE0ZWE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8x
MS4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4zLmJiCkBA
IC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iOTI1
Nzc4NWZjNGYzODAzYTRiNzFiNzZjMTQxMjcyOSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL2ZtdGxpYi9mbXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAg
IGZpbGU6Ly9maXgtZ2NjOS5wYXRjaCIKLVNSQ1JFViA9ICJlM2RkZWRlNmM0ZWU4MTg4MjVjNGU1
YTZkZmExZDM4NDg2MGMyN2Q5IgorU1JDUkVWID0gIjljZjlmMzhlZGVkNjNlNWUwZmI5NWNkNTM2
YmE1MWJlNjAxZDdmYTIiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============6352567761331651472==--

