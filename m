Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C6CCCD1A3
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17976.1759325551787171115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=v71s5nFS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UQm+cwBp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101999ff97a3d-785224d4-948e-4990-80be-7eaa455ae8dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RKuHRptYtm19my3EZ1Awx5bvJTiYONxsMLlcDklzOog=;
	b=v71s5nFSiJ8Y0LEbaNYQO6uGfPAtLjXq7RYeXVzFOF2voXS2uLlY+ozHKcW6cduB
	N1oasMMvCT6IaBRDqbBl6qeLkUA5eUuWeCr6EiiX9vZG6nSFa14LMXcn6VXGo1zslDl
	FtRvIRS0vYYrR2czkrToaZPjyfP7mPJQTgZd9mSI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RKuHRptYtm19my3EZ1Awx5bvJTiYONxsMLlcDklzOog=;
	b=UQm+cwBpDGnXSFnJP0TO3pd52Uygjqy024pEazh2zn1ZpATCvVqJffn6A4mcAoez
	0/McMlDDcr+jnuyyOJQdNc6zGbRE+C6fGIGHv1Fp662lYfqAB5AiGfLckxBAR7Nl2ZT
	+zbIQ0751vEzjt5yI8oG4f+IRA5UGbDE4+wqSWW4=
Content-Type: multipart/mixed; boundary="===============7358048221289684919=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.2 FAILED
Message-ID: <010101999ff97a3d-785224d4-948e-4990-80be-7eaa455ae8dc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224276

--===============7358048221289684919==
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
From 9ee11a88cf17d11161d35912349816610eef2a75 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 11:51:37 +0000
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


--===============7358048221289684919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-79757fd923c0589d04a7a4df479cc2ebbf1a22d6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:79757fd923c0589d04a7a4df479cc2ebbf1a22d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 340 Local 327 Mirrors 0 Missed 13 Current 583 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2147 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_recipe_qa)
NOTE: Running task 2298 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_write_config)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_recipe_qa: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_write_config: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_write_config: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2515 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_fetch)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_fetch: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2516 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_unpack)
NOTE: Running task 2517 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_unpack: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2518 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_patch)
NOTE: Running task 2519 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_collect_spdx_deps)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_patch: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2520 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2521 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_populate_lic)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_lic: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 2522 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_configure)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_configure: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2523 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_compile)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_compile: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2524 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_install)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_install: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_install: Succeeded
NOTE: Running task 2525 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package)
NOTE: Running task 2526 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_populate_sysroot)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package: Succeeded
NOTE: Running task 2527 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_packagedata)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_packagedata: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2528 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_create_spdx)
NOTE: Running task 2529 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_ipk)
NOTE: Running task 2530 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_deb)
NOTE: Running task 2531 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_rpm)
NOTE: Running task 2532 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_spdx: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_ipk: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_deb: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_qa: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2533 of 2534 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_create_package_spdx)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_package_spdx: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2533 tasks of which 2512 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001115038.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001115038.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.2/temp/log.do_package_qa.3819865
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-2.2-r0 do_package_qa: QA Issue: File /usr/lib/libigt.so.0 in package igt-gpu-tools contains reference to TMPDIR [buildpaths]
ERROR: igt-gpu-tools-2.2-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.2/temp/log.do_package_qa.3819865
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa) failed with exit code '1'

--===============7358048221289684919==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-2.1-2.2.patch"

RnJvbSA5ZWUxMWE4OGNmMTdkMTExNjFkMzU5MTIzNDk4MTY2MTBlZWYyYTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMTo1MTozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGln
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

--===============7358048221289684919==--

