Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B363CED635
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12131.1763224737035900332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jfYM7hJN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Jy91b0xb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a8862769b-0cb14973-6794-4e7f-a11f-d32cebd46730-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DbcPsLcvRQm7I1hLTUBKjsLRQ/egltDzoMCd7LTDqvM=;
	b=jfYM7hJN2canNJgaYKpjSSRcdJJprpgFm5yqZ2iprhWrHCsPIyDEzPsSV94nISmP
	GX86hY57DHPeu1CQpv9SPVZqEBZqAHHHUp21xLJuKdeYE7naQNZvKgW80Q9wmgUYisM
	fvTCq7rbtSSh6wA7Ug6OE/J4bWfBmdODSPM+lsZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DbcPsLcvRQm7I1hLTUBKjsLRQ/egltDzoMCd7LTDqvM=;
	b=Jy91b0xbXRLWDRj3GSr0pL4yYU1+olPi2HcsfXKXty8XQxhdJUGTHv+LUQfiUQ/c
	QWd/NC9cNqbuTAt4F6IBVVmQugPefGXBnSUwRWmLxZsJdFAOrND/MKFF13X7RjwprRf
	8WmxVoVENuMO6sY83qUDYnqcQ4P9t32qrzSx01oI=
Content-Type: multipart/mixed; boundary="===============4145526440910925267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] igt-gpu-tools: upgrading to 2.2 FAILED
Message-ID: <0101019a8862769b-0cb14973-6794-4e7f-a11f-d32cebd46730-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226416

--===============4145526440910925267==
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
From 451c4e2e25a9ff9c6e9844fc060b5634cd77082e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 14:02:40 +0000
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


--===============4145526440910925267==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-igt-gpu-tools-upgrade-2.1-2.2.patch"

RnJvbSA0NTFjNGUyZTI1YTlmZjljNmU5ODQ0ZmMwNjBiNTYzNGNkNzcwODJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTQ6MDI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Z3QtZ3B1LXRvb2xzOiB1cGdyYWRlIDIuMSAtPiAyLjIKCi0tLQogLi4uL3tpZ3QtZ3B1LXRvb2xz
XzIuMS5iYiA9PiBpZ3QtZ3B1LXRvb2xzXzIuMi5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMve2lndC1ncHUtdG9vbHNfMi4xLmJiID0+IGln
dC1ncHUtdG9vbHNfMi4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS10b29sc18yLjIuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0
LWdwdS10b29sc18yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1
LXRvb2xzL2lndC1ncHUtdG9vbHNfMi4yLmJiCmluZGV4IDk2ZjM1MzA0MzYuLmI5ZTU5ZDk0MjEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUt
dG9vbHNfMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2ln
dC1ncHUtdG9vbHNfMi4yLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogaW5o
ZXJpdCBtZXNvbiBwa2djb25maWcKIAotU1JDUkVWID0gIjQ4NzE4MjlkOGI3MTE3NTUzZWIyZGMx
YmRiOWEwZDE4ZGU0MjhhOTgiCitTUkNSRVYgPSAiNmFhMzAzNTExYzZiMjY3ZDIzYTNmNWM5ZmIx
OTBjODNiMjRhMzE5NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pZ3QtZ3B1LXRvb2xzLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3RhZz12
JHtQVn0gXAogICAgICAgICAgICAiCi0tIAoyLjQ3LjEKCg==

--===============4145526440910925267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-c9f21f302cf4863232dccd97a6769ae122d122aa"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c9f21f302cf4863232dccd97a6769ae122d122aa"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 342 Local 332 Mirrors 0 Missed 10 Current 581 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 722 of 923 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 833 of 923 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_deploy_source_date_epoch_setscene)
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
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_ipk unihash changed to 867b248c22463a23f8af9850a4cb838b4327fbd417d3e40e2ea4d660456fc0ca
NOTE: Running task 2533 of 2534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_create_package_spdx)
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_package_spdx: Started
NOTE: recipe igt-gpu-tools-2.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_rpm unihash changed to 62344f5c85873dba92005d66d7a157575c95925eea82fd2f69b597e3b25d1e55
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_write_deb unihash changed to 3a3eb633f8f8e0513cca724b23dc8f3723d2244d75fcac0136b76f33ce120ca3
NOTE: recipe igt-gpu-tools-2.2-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2533 tasks of which 2515 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115140141.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115140141.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.2/temp/log.do_package_qa.247690
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: igt-gpu-tools-2.2-r0 do_package_qa: QA Issue: File /usr/lib/libigt.so.0 in package igt-gpu-tools contains reference to TMPDIR [buildpaths]
ERROR: igt-gpu-tools-2.2-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/igt-gpu-tools/2.2/temp/log.do_package_qa.247690
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.2.bb:do_package_qa) failed with exit code '1'

--===============4145526440910925267==--

