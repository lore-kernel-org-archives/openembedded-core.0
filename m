Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29134C2D0CE
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1117.1714579215528662698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SS0JKZuD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1nTH8MZn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018f34e29575-af769371-ca27-4cb5-9c5f-d90c7fd24432-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=37WdIWO2pDWd+Nvx7kZj3qs7U5fNKMSTHlI+OAfsj9w=;
	b=SS0JKZuD+0axzRRg+84+FXipwUE3EOIdVul1uB9ViZYlerUr0+tWntq1cWSs8lt2
	gZGPSQdJUJ9gP/VqHmTSEVjtrDXiEF564hqe3YaC4u00TVckjJQxbDlbGVbQzehlLy7
	KB3yDlg97E0xXflrwJEJwb255SL327UxbELOvgfw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=37WdIWO2pDWd+Nvx7kZj3qs7U5fNKMSTHlI+OAfsj9w=;
	b=1nTH8MZn2w/q6jIfRvEkXElPJij/vyi9kjyu5A9bmGlF8war85ZnZNft72VLNI22
	r8JsqcEcP16vP6zAxPRy/u9dXsDXi2dTaXrTzc6NQgS4FF1SirigFCTvZGfwlLPUJcE
	jxj8/NQFPEEBn06vnt4ObWpS9muCBHxinGiFA7Bg=
Content-Type: multipart/mixed; boundary="===============8988267322504439124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xmlto: upgrading to 635dcd5bc84a7b67a3a2050a179d96e1d3050b15
 FAILED
Message-ID: <0101018f34e29575-af769371-ca27-4cb5-9c5f-d90c7fd24432-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198825

--===============8988267322504439124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xmlto* to *635dcd5bc84a7b67a3a2050a179d96e1d3050b15* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xmlto-upgrade-to-latest-revision.patch
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
From bcb4fb6aba7a6e292c31597b31d667d600a2eaa1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 08:43:32 +0000
Subject: [PATCH] xmlto: upgrade to latest revision

---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index d5a0e69849..ce4aed8240 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+SRCREV = "635dcd5bc84a7b67a3a2050a179d96e1d3050b15"
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============8988267322504439124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-15d750efce6c8c170a49b7260b3f20d820ee438d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:15d750efce6c8c170a49b7260b3f20d820ee438d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 394 Local 381 Mirrors 0 Missed 13 Current 493 (96% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1695 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_fetch)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_fetch: Succeeded
NOTE: Running task 2465 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_unpack)
NOTE: Running task 2466 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_unpack: Succeeded
NOTE: Running task 2467 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_patch)
NOTE: Running task 2468 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_collect_spdx_deps)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_patch: Succeeded
NOTE: Running task 2469 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 2470 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_lic)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_lic: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_lic unihash changed to 79460b7fc69ff35808a7d26b4e36b9c95519259479dbb3e0a3c64099b8a49777
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2471 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_configure)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_configure: Succeeded
NOTE: Running task 2472 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_compile)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_install)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_install: Succeeded
NOTE: Running task 2474 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package)
NOTE: Running task 2475 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_populate_sysroot unihash changed to 337418d4ed6dadec30cfe98381c8e8e02af2ed03a6c106b9b94932d5986fc7b8
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package: Succeeded
NOTE: Running task 2476 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_packagedata)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2477 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx)
NOTE: Running task 2478 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_ipk)
NOTE: Running task 2479 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_deb)
NOTE: Running task 2480 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_write_rpm)
NOTE: Running task 2481 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Started
WARNING: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: QA Issue: File /usr/bin/xmlto in package xmlto contains reference to TMPDIR [buildpaths]
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2482 of 2483 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_runtime_spdx)
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Started
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xmlto-0.0.28+0.0.29+git-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 2482 tasks of which 2463 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501084301.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501084301.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: QA Issue: /usr/bin/xmlto contained in package xmlto requires /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/bash, but no providers found in RDEPENDS:xmlto? [file-rdeps]
ERROR: xmlto-0.0.28+0.0.29+git-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xmlto/0.0.28+0.0.29+git/temp/log.do_package_qa.379635
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_package_qa) failed with exit code '1'

--===============8988267322504439124==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xmlto-upgrade-to-latest-revision.patch"

RnJvbSBiY2I0ZmI2YWJhN2E2ZTI5MmMzMTU5N2IzMWQ2NjdkNjAwYTJlYWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwODo0MzozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHht
bHRvOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMveG1sdG8veG1sdG9fMC4wLjI4LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3htbHRvL3htbHRvXzAuMC4yOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy94bWx0by94bWx0
b18wLjAuMjguYmIKaW5kZXggZDVhMGU2OTg0OS4uY2U0YWVkODI0MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMveG1sdG8veG1sdG9fMC4wLjI4LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9NTk1MzBiZGYzMzY1OWIyOWU3M2Q0YWRiOWY5ZjY1NTIiCiAKLVNSQ1JFViA9ICI2ZmE2YTBl
MDc2NDRmMjBhYmYyNTk2Zjc4YTYwMTEyNzEzZTExY2JlIgorU1JDUkVWID0gIjYzNWRjZDViYzg0
YTdiNjdhM2EyMDUwYTE3OWQ5NmUxZDMwNTBiMTUiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0g
IjEiCiBTUkNfVVJJID0gImdpdDovL3BhZ3VyZS5pby94bWx0by5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1hc3RlciIKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjQ0LjAKCg==

--===============8988267322504439124==--

