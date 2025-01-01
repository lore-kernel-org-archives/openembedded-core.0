Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E089CE77194
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11491.1735723942794511108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sq1dV5Xg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DMZZefOj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019421358023-b65159f3-0654-4d5e-b974-e79b10d9fefb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723942;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A8i17sX175TpnBU1Wsw3ffmlpppRmyuGXqi0h4BvYyU=;
	b=Sq1dV5Xg/2fP78//GyDRdLDQY0X+BqmqGQN4M5bzcTCfcLN3PnvOvnEdMVKIEIJd
	wl/9ECrRUHo5InH0XT7YNDO1Mb5AwwV50USYeFUt6yVpGPAewrApfMdLxZiqTT4AI2x
	yXGYtDnF7DAzC39vx6P32j4P5slr/CkWkEdgiXxI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723942;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A8i17sX175TpnBU1Wsw3ffmlpppRmyuGXqi0h4BvYyU=;
	b=DMZZefOjGoq1KrtI48EqyOwF1K8kA/kVYE8JP2U3DvGBvChIgboZYHxrLi30fkUB
	MIMGkkhdHKADOypaQdFi7uiTtbV/IrCYDQfClARwGfbAiYslJ/DbChFsM5Nu1wXnkV2
	003Er9GPxAHR7jiYzowofiKxZKj0RMVZyMrmrx/I=
Content-Type: multipart/mixed; boundary="===============1452334562782112031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 11.1.1 FAILED
Message-ID: <0101019421358023-b65159f3-0654-4d5e-b974-e79b10d9fefb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209206

--===============1452334562782112031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *11.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-fmt-upgrade-11.0.2-11.1.1.patch
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
From fc4223d5088eed8c7300131a8fb0c773b1b3f0dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 06:51:03 +0000
Subject: [PATCH] fmt: upgrade 11.0.2 -> 11.1.1

---
 meta/recipes-devtools/fmt/{fmt_11.0.2.bb => fmt_11.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fmt/{fmt_11.0.2.bb => fmt_11.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/fmt/fmt_11.0.2.bb b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/fmt/fmt_11.0.2.bb
rename to meta/recipes-devtools/fmt/fmt_11.1.1.bb
index 5c60921efa..b9c5c41fd3 100644
--- a/meta/recipes-devtools/fmt/fmt_11.0.2.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
            file://0001-Get-rid-of-std-copy.patch \
            "
-SRCREV = "0c9fce2ffefecfdce794e1859584e25877b7b592"
+SRCREV = "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============1452334562782112031==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-11.0.2-11.1.1.patch"

RnJvbSBmYzQyMjNkNTA4OGVlZDhjNzMwMDEzMWE4ZmIwYzc3M2IxYjNmMGRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNjo1MTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZt
dDogdXBncmFkZSAxMS4wLjIgLT4gMTEuMS4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9m
bXQve2ZtdF8xMS4wLjIuYmIgPT4gZm10XzExLjEuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZm10L3tmbXRfMTEuMC4yLmJiID0+IGZtdF8xMS4xLjEuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMC4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzExLjAuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTEuMS4xLmJiCmluZGV4IDVjNjA5MjFlZmEu
LmI5YzVjNDFmZDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzEx
LjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMS4xLjEuYmIKQEAg
LTcsNyArNyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWI5MjU3
Nzg1ZmM0ZjM4MDNhNGI3MWI3NmMxNDEyNzI5IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L2ZtdGxpYi9mbXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLUdldC1yaWQtb2Ytc3RkLWNvcHkucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNS
RVYgPSAiMGM5ZmNlMmZmZWZlY2ZkY2U3OTRlMTg1OTU4NGUyNTg3N2I3YjU5MiIKK1NSQ1JFViA9
ICJlM2RkZWRlNmM0ZWU4MTg4MjVjNGU1YTZkZmExZDM4NDg2MGMyN2Q5IgogCiBTID0gIiR7V09S
S0RJUn0vZ2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============1452334562782112031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:fb4d16672fcbf2449032b45ebd960da4ac06d8ae"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 93 Local 81 Mirrors 0 Missed 12 Current 212 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 779 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_recipe_qa)
NOTE: recipe fmt-11.1.1-r0: task do_recipe_qa: Started
NOTE: recipe fmt-11.1.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 899 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_fetch)
NOTE: recipe fmt-11.1.1-r0: task do_fetch: Started
NOTE: recipe fmt-11.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_unpack)
NOTE: Running task 901 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fmt-11.1.1-r0: task do_unpack: Started
NOTE: recipe fmt-11.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fmt-11.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_patch)
NOTE: Running task 903 of 919 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_collect_spdx_deps)
NOTE: recipe fmt-11.1.1-r0: task do_patch: Started
NOTE: recipe fmt-11.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fmt-11.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fmt-11.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fmt-11.1.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 903 tasks of which 897 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101065051.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101065051.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.1/temp/log.do_patch.1143323
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: fmt-11.1.1-r0 do_patch: Applying patch '0001-Get-rid-of-std-copy.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.1/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Get-rid-of-std-copy.patch
patching file include/fmt/color.h
Hunk #1 FAILED at 560.
1 out of 1 hunk FAILED -- rejects in file include/fmt/color.h
Patch 0001-Get-rid-of-std-copy.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fmt/11.1.1/temp/log.do_patch.1143323
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/fmt/fmt_11.1.1.bb:do_patch) failed with exit code '1'

--===============1452334562782112031==--

