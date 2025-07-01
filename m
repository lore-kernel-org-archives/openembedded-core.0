Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40B1C87FC5
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1430.1751386808115691791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xxPa8BPI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rAp6+rj6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca17af-67fc210f-f65b-4133-b2fc-e69edd1083d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x9KHfxa8g+kXPCzr/8QQK9U9kSK39QSs2egdWXFQ3BQ=;
	b=xxPa8BPIOtqIjb3M7vxctwSZTvT314xxjTiJ9D4xV4zvd50MaepW+aTE9Ggwzwyv
	AszZo5gElJRE7VcgG0rwZyVn0PwB6m0aPglWeL3j6aPPu2+FzwTjjEXU5Owu/dMqx/6
	G6TbphOipnBxOziHCU97xd2zqW6Oe7AQ6TFb05S8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x9KHfxa8g+kXPCzr/8QQK9U9kSK39QSs2egdWXFQ3BQ=;
	b=rAp6+rj6uLvWnbhmarjk/bZxJuVNN3ZyG19fKw22NrOZSdYSqw7kJPuj2/TMpOSu
	owd1QOQzRjGL4qwfdn37EuHIj2eXIHW2gGd5joJZMXFg7s/9gOJF1BTXr9LANq1CETV
	3S/umFqcZems9wKK8Hg+o56JTi24c2XKN7Y0jBKk=
Content-Type: multipart/mixed; boundary="===============0623354995456474139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.19.01 FAILED
Message-ID: <01010197c6ca17af-67fc210f-f65b-4133-b2fc-e69edd1083d8-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219667

--===============0623354995456474139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *stress-ng* to *0.19.01* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.18.12-0.19.01.patch
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
From a04a9e4f481f9750c1dde270f5cf47a25d2d4575 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 11:30:51 +0000
Subject: [PATCH] stress-ng: upgrade 0.18.12 -> 0.19.01

---
 .../stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.01.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb
index 85a0d6a709..f525025f3c 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV} \
            "
-SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
+SRCREV = "9b41dc45ea2bf0a07ee8659a45af2ba3d8b9e5fb"
 
 DEPENDS = "coreutils-native libbsd"
 
-- 
2.47.1


--===============0623354995456474139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.18.12-0.19.01.patch"

RnJvbSBhMDRhOWU0ZjQ4MWY5NzUwYzFkZGUyNzBmNWNmNDdhMjVkMmQ0NTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMTozMDo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmVzcy1uZzogdXBncmFkZSAwLjE4LjEyIC0+IDAuMTkuMDEKCi0tLQogLi4uL3N0cmVzcy1uZy97
c3RyZXNzLW5nXzAuMTguMTIuYmIgPT4gc3RyZXNzLW5nXzAuMTkuMDEuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy97c3RyZXNzLW5nXzAuMTguMTIuYmIgPT4gc3Ry
ZXNzLW5nXzAuMTkuMDEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4xMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTkuMDEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4x
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3Mtbmdf
MC4xOS4wMS5iYgppbmRleCA4NWEwZDZhNzA5Li5mNTI1MDI1ZjNjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjEyLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTkuMDEuYmIKQEAgLTcs
NyArNyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
Q29saW5JYW5LaW5nL3N0cmVzcy1uZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0
YWc9ViR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImQ0ZWVmOTgyZGM5OGZlOTE1YWE4
MjMwM2MwYTI0MDcwZDBhNTFiMDAiCitTUkNSRVYgPSAiOWI0MWRjNDVlYTJiZjBhMDdlZTg2NTlh
NDVhZjJiYTNkOGI5ZTVmYiIKIAogREVQRU5EUyA9ICJjb3JldXRpbHMtbmF0aXZlIGxpYmJzZCIK
IAotLSAKMi40Ny4xCgo=

--===============0623354995456474139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0552ea87f5b75ed4426f0b1c331ab8f72529c7b5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0552ea87f5b75ed4426f0b1c331ab8f72529c7b5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 114 Local 102 Mirrors 0 Missed 12 Current 282 (89% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1014 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_recipe_qa)
NOTE: recipe stress-ng-0.19.01-r0: task do_recipe_qa: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_recipe_qa unihash changed to 7bf8c33bf2a49a7797edd24b94fe695d7955f7ecbaf64ee6c4e20761234015b0
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_fetch)
NOTE: recipe stress-ng-0.19.01-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_fetch: Succeeded
NOTE: Running task 1139 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_unpack)
NOTE: Running task 1140 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.19.01-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_unpack: Succeeded
NOTE: Running task 1141 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_patch)
NOTE: Running task 1142 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_collect_spdx_deps)
NOTE: recipe stress-ng-0.19.01-r0: task do_patch: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_collect_spdx_deps: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_patch: Succeeded
NOTE: Running task 1143 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_deploy_source_date_epoch)
NOTE: Running task 1144 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_populate_lic)
NOTE: recipe stress-ng-0.19.01-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_populate_lic unihash changed to 7a35b8f21f36143168c0946a90d903195a54c00d003d6b730ca942af1b71a391
NOTE: recipe stress-ng-0.19.01-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_deploy_source_date_epoch unihash changed to 970f97b1f8941de87c6275a68ac9bfcd0b4617fe88b11f1b1c6801725693761c
NOTE: Setscene tasks completed
NOTE: Running task 1145 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_configure)
NOTE: recipe stress-ng-0.19.01-r0: task do_configure: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_compile)
NOTE: recipe stress-ng-0.19.01-r0: task do_compile: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_install)
NOTE: recipe stress-ng-0.19.01-r0: task do_install: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package)
NOTE: Running task 1149 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.19.01-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_package: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_package: Succeeded
NOTE: Running task 1150 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_packagedata)
NOTE: recipe stress-ng-0.19.01-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_packagedata: Succeeded
NOTE: Running task 1151 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_create_spdx)
NOTE: Running task 1152 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_write_ipk)
NOTE: Running task 1153 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_write_deb)
NOTE: Running task 1154 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_write_rpm)
NOTE: Running task 1155 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_qa)
NOTE: recipe stress-ng-0.19.01-r0: task do_create_spdx: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_package_write_ipk: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_package_write_deb: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_create_spdx: Succeeded
NOTE: Running task 1156 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_create_package_spdx)
NOTE: recipe stress-ng-0.19.01-r0: task do_create_package_spdx: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_package_write_ipk: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_create_package_spdx: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_package_write_deb: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 1156 tasks of which 1136 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701112849.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701112849.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/stress-ng/0.19.01/temp/log.do_package_qa.1502476
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: stress-ng-0.19.01-r0 do_package_qa: QA Issue: File /usr/bin/stress-ng in package stress-ng contains reference to TMPDIR [buildpaths]
ERROR: stress-ng-0.19.01-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/stress-ng/0.19.01/temp/log.do_package_qa.1502476
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_qa) failed with exit code '1'

--===============0623354995456474139==--

