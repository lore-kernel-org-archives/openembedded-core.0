Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BA4D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17388.1765872134050108079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZCBb8Ngv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DFucSgFx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e67ff-0c9e07f8-be2c-451a-8e38-9043cc5d306e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YnD4d1DPHdsefttqxRq1Iv8IRtRajyCFSfo4SrkwEfE=;
	b=ZCBb8NgvRzPEVDkEuRT3xxjUafPb8lEAnK3aqebxmfvuMrzC6Fs9vnsK2t7ugF1G
	txVJeoPleVntMWwSw1RXYqS6aBatZV4cHSndrlCaXYiG5Eh7oNP3WYlKMRs6P5nunxp
	ea35lanac6APcegpakCDZRTajcMNEzgyF0W0+emw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YnD4d1DPHdsefttqxRq1Iv8IRtRajyCFSfo4SrkwEfE=;
	b=DFucSgFxy3Yp2g/R53iG5zxywkHO5I3wZGvNuvKEG6OMVpwcgX746t0AB6s5+Cqd
	nVDD8Bwv0+9i0T4WK+7VQ7VUEwo2dhxBv4MzB5M9hEvdU7MLUF9PnhZarDaQulSGTIv
	aLx+nYjKVB33roocXyOo6vTB8plgDmQSiypEV+vk=
Content-Type: multipart/mixed; boundary="===============7873383928014807538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Stefano Babic <sbabic@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libubootenv: upgrading to 0.3.7 FAILED
Message-ID: <0101019b262e67ff-0c9e07f8-be2c-451a-8e38-9043cc5d306e-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227775

--===============7873383928014807538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libubootenv* to *0.3.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libubootenv-upgrade-0.3.6-0.3.7.patch
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
From f892c0409976d9203af7501aa6a6e7e5e91fcf15 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 21:52:39 +0000
Subject: [PATCH] libubootenv: upgrade 0.3.6 -> 0.3.7

---
 .../u-boot/{libubootenv_0.3.6.bb => libubootenv_0.3.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.6.bb => libubootenv_0.3.7.bb} (94%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
similarity index 94%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
index b63b8ff87d..b3fcbd9c0b 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master \
            file://0001-Update-cmake_minimum_required-to-3.5.patch \
            "
-SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"
+SRCREV = "1e3511ed77f794ee5decc0974d54c8e5af26f64c"
 
 inherit cmake lib_package
 
-- 
2.47.1


--===============7873383928014807538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libubootenv-upgrade-0.3.6-0.3.7.patch"

RnJvbSBmODkyYzA0MDk5NzZkOTIwM2FmNzUwMWFhNmE2ZTdlNWU5MWZjZjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjE6NTI6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1Ym9vdGVudjogdXBncmFkZSAwLjMuNiAtPiAwLjMuNwoKLS0tCiAuLi4vdS1ib290L3tsaWJ1
Ym9vdGVudl8wLjMuNi5iYiA9PiBsaWJ1Ym9vdGVudl8wLjMuNy5iYn0gICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtYnNwL3UtYm9vdC97bGlidWJvb3RlbnZfMC4zLjYuYmIgPT4gbGlidWJvb3RlbnZf
MC4zLjcuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGli
dWJvb3RlbnZfMC4zLjYuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8w
LjMuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNw
L3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC91
LWJvb3QvbGlidWJvb3RlbnZfMC4zLjcuYmIKaW5kZXggYjYzYjhmZjg3ZC4uYjNmY2JkOWMwYiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjYuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjcuYmIKQEAgLTEz
LDcgKzEzLDcgQEAgU0VDVElPTiA9ICJsaWJzIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L3NiYWJpYy9saWJ1Ym9vdGVudjtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtVXBkYXRlLWNtYWtlX21pbmltdW1fcmVxdWlyZWQtdG8tMy41LnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjU1MDczMzk2MjhiNWNhZjI0NGUxZmY5ZDU4
Y2IzZmE1MzRiMTZiZWIiCitTUkNSRVYgPSAiMWUzNTExZWQ3N2Y3OTRlZTVkZWNjMDk3NGQ1NGM4
ZTVhZjI2ZjY0YyIKIAogaW5oZXJpdCBjbWFrZSBsaWJfcGFja2FnZQogCi0tIAoyLjQ3LjEKCg==

--===============7873383928014807538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a16190c58c67286fbb4f04f9f5dadb348eeaf330"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a16190c58c67286fbb4f04f9f5dadb348eeaf330"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 91 Local 80 Mirrors 0 Missed 11 Current 282 (87% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 373 of 373 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libubootenv-0.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libubootenv-0.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 1107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_fetch)
NOTE: recipe libubootenv-0.3.7-r0: task do_fetch: Started
NOTE: recipe libubootenv-0.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1088 of 1107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_unpack)
NOTE: Running task 1089 of 1107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libubootenv-0.3.7-r0: task do_unpack: Started
NOTE: recipe libubootenv-0.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libubootenv-0.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libubootenv-0.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1090 of 1107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_patch)
NOTE: Running task 1091 of 1107 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libubootenv-0.3.7-r0: task do_patch: Started
NOTE: recipe libubootenv-0.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libubootenv-0.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libubootenv-0.3.7-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1091 tasks of which 1086 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251215215227.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251215215227.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libubootenv/0.3.7/temp/log.do_patch.2085802
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libubootenv-0.3.7-r0 do_patch: Applying patch '0001-Update-cmake_minimum_required-to-3.5.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libubootenv/0.3.7/sources/libubootenv-0.3.7'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libubootenv/0.3.7/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Update-cmake_minimum_required-to-3.5.patch
patching file CMakeLists.txt
Hunk #1 FAILED at 2.
1 out of 1 hunk FAILED -- rejects in file CMakeLists.txt
patching file src/CMakeLists.txt
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file src/CMakeLists.txt
Patch 0001-Update-cmake_minimum_required-to-3.5.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libubootenv/0.3.7/temp/log.do_patch.2085802
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb:do_patch) failed with exit code '1'

--===============7873383928014807538==--

