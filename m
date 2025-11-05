Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A886CCD13DA
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2339.1762384568903480648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GpKLEGpG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=k1BSeMlB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a564ed593-115ff2ec-406f-4cc3-b5aa-266bb1b607a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0oCY6UMn3ULAUplqLnK0eZE+Spd2q8/uvFSWGG11O/M=;
	b=GpKLEGpG2s5z8aACGpiogegcObCM9p3cR6ndNyrE2ckPyIoxmLlFjmFJv61GUo14
	XLYwRgsL+0Q98r4WyuHyzruB/nQyAySUeli55etQj6uvJfEJY83sA4Hmf/U+McKaXDx
	DizFSI/t7tn9Q/1eSxU0Q0/h9GtX8KjdTX8hD7Ug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0oCY6UMn3ULAUplqLnK0eZE+Spd2q8/uvFSWGG11O/M=;
	b=k1BSeMlB9/JmEloqdrMSCkavtQ87ejQm5RfaF1YotYLR8z/TuzCnw1IPCzmUazvK
	NZC7ok5kpCUFSQgJAcjRLTA9vKiyYZQ9hWSoj+2sBtyRWcqDGFhRqaXSr6lAMyXtBSr
	Fkasyx3vNDhMz+nw3LuypDPfif05KZTSUoIpawHU=
Content-Type: multipart/mixed; boundary="===============2503922688753128308=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.2 FAILED
Message-ID: <0101019a564ed593-115ff2ec-406f-4cc3-b5aa-266bb1b607a3-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225882

--===============2503922688753128308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *igt-gpu-tools* to *2.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-igt-gpu-tools-upgrade-2.1-2.2.patch
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
From 8a239a1421a347f28ccaa7f8c23861c0fbdae9a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 20:24:41 +0000
Subject: [PATCH] igt-gpu-tools: upgrade 2.1 -> 2.2

---
 .../{igt-gpu-tools_2.1.bb => igt-gpu-tools_2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/igt-gpu-tools/{igt-gpu-tools_2.1.bb => igt-gpu-tools_2.2.bb} (97%)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb
similarity index 97%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb
index 96f3530436..b9e59d9421 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.1.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "4871829d8b7117553eb2dc1bdb9a0d18de428a98"
+SRCREV = "6aa303511c6b267d23a3f5c9fb190c83b24a3197"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
            "
-- 
2.47.1


--===============2503922688753128308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9a18f98a66e83197988d29c96bbf5f2c30ba0e28"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9a18f98a66e83197988d29c96bbf5f2c30ba0e28"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 342 Local 332 Mirrors 0 Missed 10 Current 581 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 657 of 923 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 857 of 923 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 923 of 923 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_recipe_qa_setscene)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_fetch)
NOTE: Running task 2299 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_write_config)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2516 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_unpack)
NOTE: Running task 2517 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2518 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_patch)
NOTE: Running task 2519 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_collect_spdx_deps)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2521 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_configure)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_configure: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2523 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_compile)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_compile: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2524 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_install)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_install: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_install: Succeeded
NOTE: Running task 2525 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package)
NOTE: Running task 2526 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_populate_sysroot)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package: Succeeded
NOTE: Running task 2527 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_packagedata)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_packagedata: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_packagedata unihash changed to 619228c1a6d7b884eb114c5169bc091133e8382bff5971321e6d02aee59546b8
NOTE: Setscene tasks completed
NOTE: Running task 2528 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_create_spdx)
NOTE: Running task 2529 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_ipk)
NOTE: Running task 2530 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_deb)
NOTE: Running task 2531 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_rpm)
NOTE: Running task 2532 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_spdx: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_ipk: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_deb: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_qa: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2533 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_create_package_spdx)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_package_spdx: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2533 tasks of which 2515 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105202341.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105202341.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.2/temp/log.do_package_qa.3240920
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-2.2-r0 do_package_qa: QA Issue: File /usr/lib/libigt.so.0 in package igt-gpu-tools contains reference to TMPDIR [buildpaths]
ERROR: igt-gpu-tools-2.2-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.2/temp/log.do_package_qa.3240920
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa) failed with exit code '1'

--===============2503922688753128308==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-2.1-2.2.patch"

RnJvbSA4YTIzOWExNDIxYTM0N2YyOGNjYWE3ZjhjMjM4NjFjMGZiZGFlOWEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMDoyNDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGln
dC1ncHUtdG9vbHM6IHVwZ3JhZGUgMi4xIC0+IDIuMgoKLS0tCiAuLi4ve2lndC1ncHUtdG9vbHNf
Mi4xLmJiID0+IGlndC1ncHUtdG9vbHNfMi4yLmJifSAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy97aWd0LWdwdS10b29sc18yLjEuYmIgPT4gaWd0
LWdwdS10b29sc18yLjIuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc18yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzXzIuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3Qt
Z3B1LXRvb2xzXzIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUt
dG9vbHMvaWd0LWdwdS10b29sc18yLjIuYmIKaW5kZXggOTZmMzUzMDQzNi4uYjllNTlkOTQyMSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10
b29sc18yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0
LWdwdS10b29sc18yLjIuYmIKQEAgLTksNyArOSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogCiBpbmhl
cml0IG1lc29uIHBrZ2NvbmZpZwogCi1TUkNSRVYgPSAiNDg3MTgyOWQ4YjcxMTc1NTNlYjJkYzFi
ZGI5YTBkMThkZTQyOGE5OCIKK1NSQ1JFViA9ICI2YWEzMDM1MTFjNmIyNjdkMjNhM2Y1YzlmYjE5
MGM4M2IyNGEzMTk3IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2lndC1ncHUtdG9vbHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYk
e1BWfSBcCiAgICAgICAgICAgICIKLS0gCjIuNDcuMQoK

--===============2503922688753128308==--

