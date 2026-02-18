Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23389E9A05F
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1402.1771440091416486362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dkkrRPrQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PgT+B+BI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720ed760-810dfe91-0557-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DNw3hle6vW0Ifz4HH1pBZlza96mMPDQSzzQy+Kgp6+A=;
	b=dkkrRPrQHYPHPNTvkAQleMEDfr0fWh7Qudj9qNImo/+YvS7p6qXppq/3YxOqp2w7
	ZjAwPN5rPPTPff4baDuugEQZX/XYU5vlet00960P4kJPQvU0PQIPJbZqxAp9nzqABrG
	ti0gqwuN8c5M4x63mIv1N+kHGI2L4dCNRXuCq4DI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DNw3hle6vW0Ifz4HH1pBZlza96mMPDQSzzQy+Kgp6+A=;
	b=PgT+B+BIc0D0vLe0fUQACZlwJHRkjT1obQ13FO1z4Kotvy0nsK7hJYb8jgvt8hZP
	i8zq+hnNeUvMhitm4wphYg99IrG811keKq3yRLD3dkDJu0VWOiKWbB8NQSBjDac3PZI
	xLSqE5XZcQn8fbAFBUULcseN6w+r4pr1byXUViu4=
Content-Type: multipart/mixed; boundary="===============0300642493784463056=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 9d19a7870add65151ff91bcc26252bb7521065cf
 SUCCEEDED
Message-ID: <0101019c720ed760-810dfe91-0557-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231348

--===============0300642493784463056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *9d19a7870add65151ff91bcc26252bb7521065cf* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From 40bcbef143dea832d97d3ace0a72214f58f8b6b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:55:35 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 81d1814191..0b139ac5f0 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
+SRCREV = "9d19a7870add65151ff91bcc26252bb7521065cf"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============0300642493784463056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-8c9800e0aef2e1451e8bfb6cf6b6ef38997a4570"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8c9800e0aef2e1451e8bfb6cf6b6ef38997a4570"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 89 Local 78 Mirrors 0 Missed 11 Current 267 (87% match, 96% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 933 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_fetch)
NOTE: recipe gn-0+git-r0: task do_fetch: Started
NOTE: recipe gn-0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1043 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_unpack)
NOTE: Running task 1044 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gn-0+git-r0: task do_unpack: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gn-0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1045 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_patch)
NOTE: Running task 1046 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_collect_spdx_deps)
NOTE: recipe gn-0+git-r0: task do_patch: Started
NOTE: recipe gn-0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe gn-0+git-r0: task do_patch: Succeeded
NOTE: Running task 1047 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1048 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic)
NOTE: recipe gn-0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic unihash changed to 1ee3cf3b79fad961c8a79e8eedc3ac4466b9de812f90bbe7bf94d504fe123a22
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1049 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_configure)
NOTE: recipe gn-0+git-r0: task do_configure: Started
NOTE: recipe gn-0+git-r0: task do_configure: Succeeded
NOTE: Running task 1050 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_compile)
NOTE: recipe gn-0+git-r0: task do_compile: Started
NOTE: recipe gn-0+git-r0: task do_compile: Succeeded
NOTE: Running task 1051 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_install)
NOTE: recipe gn-0+git-r0: task do_install: Started
NOTE: recipe gn-0+git-r0: task do_install: Succeeded
NOTE: Running task 1052 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package)
NOTE: Running task 1053 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot)
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_package: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to 83a3e3d2a0619ea008eb3aac5b3c1dda9ba9c131d1f1e111b87cc1280608505f
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Running task 1054 of 1061 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1054 tasks of which 1041 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218125409.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218125409.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.236113
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+103f8b437f-r0 to 0:0+git0+9d19a7870a-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.236113
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata) failed with exit code '1'

--===============0300642493784463056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+103f8b437f-r0'])", added "gn (['= 0+git0+9d19a7870a-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+103f8b437f-r0'])", added "gn-dev (['= 0+git0+9d19a7870a-r0'])"
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a

--===============0300642493784463056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 100552288 to 100806536 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+103f8b437f-r0'])", added "gn (['= 0+git0+9d19a7870a-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3124483 to 3139692 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+103f8b437f-r0'])", added "gn-dev (['= 0+git0+9d19a7870a-r0'])"
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+103f8b437f to 0+git0+9d19a7870a
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3682488 to 3698872 (+0%)

--===============0300642493784463056==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSA0MGJjYmVmMTQzZGVhODMyZDk3ZDNhY2UwYTcyMjE0ZjU4ZjhiNmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6NTU6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IDgxZDE4MTQxOTEu
LjBiMTM5YWM1ZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgREVQRU5EUyArPSAibmluamEtbmF0aXZlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiMTAzZjhiNDM3ZjVlNzkxZTBhZWY5ZDVjMzcyNTIx
YTVkNjc1ZmFiYiIKK1NSQ1JFViA9ICI5ZDE5YTc4NzBhZGQ2NTE1MWZmOTFiY2MyNjI1MmJiNzUy
MTA2NWNmIgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============0300642493784463056==--

