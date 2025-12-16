Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F724D5CCA7
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17391.1765872135074496581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dBqr5tJX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=o4sgm800;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262eb9f8-fbfffc5c-2564-4825-842e-ecf75776f98c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WnW5/PvEYAwYQqRJCB/o/YiXZoX7y4ca4EHE89CcX6M=;
	b=dBqr5tJXFhGCRoInamLXZhSg8lva+pJPk3EEdQ5ySzZwBkmndJ1y7sT94XXrCFlT
	vndBFbvQjAgSWlq2JyPxrtdJlC+zvfLfwTsMwFZ7HkAugM45q43SlAr5TOwJ59E4JYy
	qRpiQbWY/uLsRCiyG50SdMzwdNYJKywXL3EuHBqs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WnW5/PvEYAwYQqRJCB/o/YiXZoX7y4ca4EHE89CcX6M=;
	b=o4sgm800BSis0Sy/92qbRQregaeaa1g7RFJcK6VxVo7YmA1qR8hUqUpCi9WUC+se
	Ev3R3RVTx8rqJfq6U5ZYeNypfcXygWXMTDGW5C6ku4N8hdD20tR0IXq+OT/UoXbx+vq
	Jq9ngs+KGyUW9E4xJ4o40N+voCHHSCTENWKuiDag=
Content-Type: multipart/mixed; boundary="===============1213079314920094004=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libconfig: upgrading to 1.8.2 FAILED
Message-ID: <0101019b262eb9f8-fbfffc5c-2564-4825-842e-ecf75776f98c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227850

--===============1213079314920094004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libconfig* to *1.8.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libconfig-upgrade-1.8.1-1.8.2.patch
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
From 613916c6faeb667a0497c15e9f1e1237c233a47d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 02:50:21 +0000
Subject: [PATCH] libconfig: upgrade 1.8.1 -> 1.8.2

---
 .../libconfig/{libconfig_1.8.1.bb => libconfig_1.8.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libconfig/{libconfig_1.8.1.bb => libconfig_1.8.2.bb} (94%)

diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.1.bb b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
similarity index 94%
rename from meta/recipes-extended/libconfig/libconfig_1.8.1.bb
rename to meta/recipes-extended/libconfig/libconfig_1.8.2.bb
index 37c2504b01..33f2fe398f 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
     file://0001-Add-missing-dependency-for-scanner.h.patch \
 "
-SRCREV = "47ec93c588f534d20f6ee8704d2a2cec339db7b7"
+SRCREV = "a42cb47c1526a4f2ed025fcbb2289863375bc898"
 
 # needed when we modify grammar.y with patches
 DEPENDS += "bison-native flex-native"
-- 
2.47.1


--===============1213079314920094004==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconfig-upgrade-1.8.1-1.8.2.patch"

RnJvbSA2MTM5MTZjNmZhZWI2NjdhMDQ5N2MxNWU5ZjFlMTIzN2MyMzNhNDdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDI6NTA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb25maWc6IHVwZ3JhZGUgMS44LjEgLT4gMS44LjIKCi0tLQogLi4uL2xpYmNvbmZpZy97bGli
Y29uZmlnXzEuOC4xLmJiID0+IGxpYmNvbmZpZ18xLjguMi5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYmNvbmZpZy97bGliY29uZmlnXzEuOC4xLmJiID0+IGxpYmNvbmZp
Z18xLjguMi5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGli
Y29uZmlnL2xpYmNvbmZpZ18xLjguMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJjb25m
aWcvbGliY29uZmlnXzEuOC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWJjb25maWcvbGliY29uZmlnXzEuOC4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliY29uZmlnL2xpYmNvbmZpZ18xLjguMi5iYgppbmRl
eCAzN2MyNTA0YjAxLi4zM2YyZmUzOThmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliY29uZmlnL2xpYmNvbmZpZ18xLjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGliY29uZmlnL2xpYmNvbmZpZ18xLjguMi5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJ
ID0gIiBcCiAgICAgZ2l0Oi8vZ2l0aHViLmNvbS9oeXBlcnJlYWxtL2xpYmNvbmZpZy5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9IFwKICAgICBmaWxlOi8vMDAwMS1B
ZGQtbWlzc2luZy1kZXBlbmRlbmN5LWZvci1zY2FubmVyLmgucGF0Y2ggXAogIgotU1JDUkVWID0g
IjQ3ZWM5M2M1ODhmNTM0ZDIwZjZlZTg3MDRkMmEyY2VjMzM5ZGI3YjciCitTUkNSRVYgPSAiYTQy
Y2I0N2MxNTI2YTRmMmVkMDI1ZmNiYjIyODk4NjMzNzViYzg5OCIKIAogIyBuZWVkZWQgd2hlbiB3
ZSBtb2RpZnkgZ3JhbW1hci55IHdpdGggcGF0Y2hlcwogREVQRU5EUyArPSAiYmlzb24tbmF0aXZl
IGZsZXgtbmF0aXZlIgotLSAKMi40Ny4xCgo=

--===============1213079314920094004==
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
DISTRO_VERSION       = "5.2.99+snapshot-c3e516c6fbdd27c561fc7268940c8cf2f7423f1b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c3e516c6fbdd27c561fc7268940c8cf2f7423f1b"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 81 Local 70 Mirrors 0 Missed 11 Current 280 (86% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 361 of 361 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libconfig-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libconfig-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1056 of 1075 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_fetch)
NOTE: recipe libconfig-1.8.2-r0: task do_fetch: Started
NOTE: recipe libconfig-1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 1075 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_unpack)
NOTE: Running task 1058 of 1075 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libconfig-1.8.2-r0: task do_unpack: Started
NOTE: recipe libconfig-1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libconfig-1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libconfig-1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1059 of 1075 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_patch)
NOTE: Running task 1060 of 1075 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libconfig-1.8.2-r0: task do_patch: Started
NOTE: recipe libconfig-1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libconfig-1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libconfig-1.8.2-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1060 tasks of which 1055 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216025010.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216025010.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libconfig/1.8.2/temp/log.do_patch.1643928
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libconfig-1.8.2-r0 do_patch: QA Issue: Fuzz detected:

Applying patch 0001-Add-missing-dependency-for-scanner.h.patch
patching file lib/Makefile.am
Hunk #1 succeeded at 39 with fuzz 2 (offset 3 lines).


The context lines in the patches can be updated with devtool:

    devtool modify libconfig
    devtool finish --force-patch-refresh libconfig <layer_path>

Don't forget to review changes done by devtool!

Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: libconfig-1.8.2-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libconfig/1.8.2/temp/log.do_patch.1643928
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libconfig/libconfig_1.8.2.bb:do_patch) failed with exit code '1'

--===============1213079314920094004==--

