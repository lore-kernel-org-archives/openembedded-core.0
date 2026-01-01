Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9207CEEE254
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:38:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102974.1767267476398781884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wK4PNpzl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EUmCaZ63;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019b7959ac8e-fe97dd2a-acd7-4d1b-8a86-325696b0fcca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hSssPsdA7Zk+vw8ph+9CeWGMFvr4Mq1JsGzV5+42oTk=;
	b=wK4PNpzlbc+dZ6FA5LZqtfKYuU28Zf8/EEtS5QTHeqNvUrVuTpahYwPubArCD+3W
	U3irNclomzloXbVHowyfXnxxcEb6dt2F6avtpEO2O6ae1fqfELWX3LOVTUWLrDDR0BH
	9fxB3iOQMA3E6NlZNJB591DLwRlO5cGkgIR/c0QE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267478;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hSssPsdA7Zk+vw8ph+9CeWGMFvr4Mq1JsGzV5+42oTk=;
	b=EUmCaZ630jtWRBFdXSymQiI2wxQ2Zm9nv67XHndAdR3HO2FAKV7+bhNEiPvd/Tse
	Ld0xKBctCx6DdthVZE/nZdlE4+fBjCC/dVR+zLEll68WzKsYFl+1Dsa/0bBylW/ueNm
	pwBX+6Sq8u5vtXYEeXZAyr5AZly++yB4vm4tc9mY=
Content-Type: multipart/mixed; boundary="===============7842926373427236815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.3 FAILED
Message-ID: <0101019b7959ac8e-fe97dd2a-acd7-4d1b-8a86-325696b0fcca-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228793

--===============7842926373427236815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-igt-gpu-tools-upgrade-2.1-2.3.patch
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
From 17b1e52055cf5ae30312895b651926eb7661f61a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 10:12:32 +0000
Subject: [PATCH] igt-gpu-tools: upgrade 2.1 -> 2.3

---
 .../{igt-gpu-tools_2.1.bb => igt-gpu-tools_2.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.1.bb => igt-gpu-tools_2.3.bb} (97%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
similarity index 97%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
index 96f3530436..989cd0c915 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "4871829d8b7117553eb2dc1bdb9a0d18de428a98"
+SRCREV = "2d7ec9a36c550c48af4bdd6e748f6753369ab8ff"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            "
-- 
2.47.1


--===============7842926373427236815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-04a72934d7cc4053817fc1d011f4a2e1d6a74b27"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:04a72934d7cc4053817fc1d011f4a2e1d6a74b27"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 256 Local 243 Mirrors 0 Missed 13 Current 672 (94% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2158 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_recipe_qa)
NOTE: Running task 2313 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_write_config)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_recipe_qa: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_recipe_qa unihash changed to 72925b3dcda889a0c25f3b15d6af953019f8fcb3bad7fdc78427085040f444f5
NOTE: Setscene tasks completed
NOTE: Running task 2530 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_fetch)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2531 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_unpack)
NOTE: Running task 2532 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2533 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_patch)
NOTE: Running task 2534 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_collect_spdx_deps)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_patch: Succeeded
NOTE: Running task 2535 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2536 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_populate_lic)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_populate_lic: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_populate_lic unihash changed to aaa5539efa0c2774dbd14eea3876e5578911f37503d5b8f74dccf5a8b9b49cf4
NOTE: recipe igt-gpu-tools-2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_deploy_source_date_epoch unihash changed to 5696f738ba4e5cf26724f50d91fd6188992652cfb70d5780c309e2cf6124b2b5
NOTE: Setscene tasks completed
NOTE: Running task 2537 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_configure)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_configure: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_configure: Succeeded
NOTE: Running task 2538 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_compile)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_compile: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_compile: Succeeded
NOTE: Running task 2539 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_install)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_install: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_install: Succeeded
NOTE: Running task 2540 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package)
NOTE: Running task 2541 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_populate_sysroot)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_populate_sysroot: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package: Succeeded
NOTE: Running task 2542 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_packagedata)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_packagedata: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2543 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_create_spdx)
NOTE: Running task 2544 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package_write_ipk)
NOTE: Running task 2545 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package_write_deb)
NOTE: Running task 2546 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package_write_rpm)
NOTE: Running task 2547 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package_qa)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_create_spdx: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_write_ipk: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_write_deb: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_write_rpm: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_qa: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2548 of 2549 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_create_package_spdx)
NOTE: recipe igt-gpu-tools-2.3-r0: task do_create_package_spdx: Started
NOTE: recipe igt-gpu-tools-2.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe igt-gpu-tools-2.3-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2548 tasks of which 2527 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101101129.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101101129.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.3/temp/log.do_package_qa.1518654
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-2.3-r0 do_package_qa: QA Issue: File /usr/lib/libigt.so.0 in package igt-gpu-tools contains reference to TMPDIR [buildpaths]
ERROR: igt-gpu-tools-2.3-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.3/temp/log.do_package_qa.1518654
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.3.bb:do_package_qa) failed with exit code '1'

--===============7842926373427236815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-2.1-2.3.patch"

RnJvbSAxN2IxZTUyMDU1Y2Y1YWUzMDMxMjg5NWI2NTE5MjZlYjc2NjFmNjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAxMDoxMjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGln
dC1ncHUtdG9vbHM6IHVwZ3JhZGUgMi4xIC0+IDIuMwoKLS0tCiAuLi4ve2lndC1ncHUtdG9vbHNf
Mi4xLmJiID0+IGlndC1ncHUtdG9vbHNfMi4zLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy97aWd0LWdwdS10b29sc18yLjEuYmIgPT4gaWd0
LWdwdS10b29sc18yLjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc18yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzXzIuMy5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3Qt
Z3B1LXRvb2xzXzIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUt
dG9vbHMvaWd0LWdwdS10b29sc18yLjMuYmIKaW5kZXggOTZmMzUzMDQzNi4uOTg5Y2QwYzkxNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10
b29sc18yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0
LWdwdS10b29sc18yLjMuYmIKQEAgLTksNyArOSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogCiBpbmhl
cml0IG1lc29uIHBrZ2NvbmZpZwogCi1TUkNSRVYgPSAiNDg3MTgyOWQ4YjcxMTc1NTNlYjJkYzFi
ZGI5YTBkMThkZTQyOGE5OCIKK1NSQ1JFViA9ICIyZDdlYzlhMzZjNTUwYzQ4YWY0YmRkNmU3NDhm
Njc1MzM2OWFiOGZmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2lndC1ncHUtdG9vbHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYk
e1BWfSBcCiAgICAgICAgICAgICIKLS0gCjIuNDcuMQoK

--===============7842926373427236815==--

