Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA6EC83F0C
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8899.1749993296355959123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d9Dxq3El;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=he81H/qS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773ba8ff2-c9ca987c-5861-4943-94a6-aae311f03274-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JV3jutl6vyZ37qW7VOxjKrJfGy8X7OAwoByKr1KU6SI=;
	b=d9Dxq3ElXRcS6eGUFmglnUoAn4bGh2M43sFLsAtsTig+HW4YZ0uKN6a6l/niT4jw
	8XodB+tR0VoGP858n3NWN2Dwf/CCT8jDkIsdbVmkFjVNksFvu/NLRaH/vId350SiW0o
	VG6mkfQbBk7HQ3or0Tq5UtQpvstUBxJNUnAjug74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JV3jutl6vyZ37qW7VOxjKrJfGy8X7OAwoByKr1KU6SI=;
	b=he81H/qS3tdzm69WZUmzELyYKlgBNOgHOgXwNUa1RKgOrISIKTSlG1u72ch+4oeg
	1XFYWHtoEqy5Jyxv1OXHSW9Toz39CzfiNu8i4JZNIclOwbRRdz1aL41P5RuBjhZ2Xbg
	kqidW6ySlpog9mn7lZzm+H7z9k6Os6MkNmCJpQa4=
Content-Type: multipart/mixed; boundary="===============4440443227152336045=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.19.01 FAILED
Message-ID: <0101019773ba8ff2-c9ca987c-5861-4943-94a6-aae311f03274-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218710

--===============4440443227152336045==
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
From 71722d1d6146741f9c260b1b2e25ca4f06816ca3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 10:29:53 +0000
Subject: [PATCH] stress-ng: upgrade 0.18.12 -> 0.19.01

---
 .../stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.01.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb
index b1cfdc371f..9d080a4ec4 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV} \
            "
-SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
+SRCREV = "9b41dc45ea2bf0a07ee8659a45af2ba3d8b9e5fb"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.47.1


--===============4440443227152336045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1910 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:173da5e5b3a1fbeff73b5f154f3f14a543d4f7c0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 122 Local 110 Mirrors 0 Missed 12 Current 274 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1014 of 1157 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_recipe_qa)
NOTE: recipe stress-ng-0.19.01-r0: task do_recipe_qa: Started
NOTE: recipe stress-ng-0.19.01-r0: task do_recipe_qa: Succeeded
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
NOTE: recipe stress-ng-0.19.01-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe stress-ng-0.19.01-r0: task do_populate_lic: Succeeded
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
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615102749.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615102749.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/stress-ng/0.19.01/temp/log.do_package_qa.1187826
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: stress-ng-0.19.01-r0 do_package_qa: QA Issue: File /usr/bin/stress-ng in package stress-ng contains reference to TMPDIR [buildpaths]
ERROR: stress-ng-0.19.01-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/stress-ng/0.19.01/temp/log.do_package_qa.1187826
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.01.bb:do_package_qa) failed with exit code '1'

--===============4440443227152336045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.18.12-0.19.01.patch"

RnJvbSA3MTcyMmQxZDYxNDY3NDFmOWMyNjBiMWIyZTI1Y2E0ZjA2ODE2Y2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTA6Mjk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJlc3Mtbmc6IHVwZ3JhZGUgMC4xOC4xMiAtPiAwLjE5LjAxCgotLS0KIC4uLi9zdHJlc3Mtbmcv
e3N0cmVzcy1uZ18wLjE4LjEyLmJiID0+IHN0cmVzcy1uZ18wLjE5LjAxLmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcve3N0cmVzcy1uZ18wLjE4LjEyLmJiID0+IHN0
cmVzcy1uZ18wLjE5LjAxLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTguMTIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE5LjAxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTgu
MTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5n
XzAuMTkuMDEuYmIKaW5kZXggYjFjZmRjMzcxZi4uOWQwODBhNGVjNCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4xMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE5LjAxLmJiCkBAIC03
LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0NvbGluSWFuS2luZy9zdHJlc3MtbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7
dGFnPVYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICJkNGVlZjk4MmRjOThmZTkxNWFh
ODIzMDNjMGEyNDA3MGQwYTUxYjAwIgorU1JDUkVWID0gIjliNDFkYzQ1ZWEyYmYwYTA3ZWU4NjU5
YTQ1YWYyYmEzZDhiOWU1ZmIiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBERVBFTkRTID0gImNv
cmV1dGlscy1uYXRpdmUgbGliYnNkIgotLSAKMi40Ny4xCgo=

--===============4440443227152336045==--

