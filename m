Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1098C021BB
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42717.1738416051266334107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SqYgSgRo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=omhQme/L;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abd159-f2c132e9-3e65-44ed-99e8-3aa0e56e5760-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HIsGmOJogfkg/XVd0r14VLmYBwMVs/vprYcSoaTdtyg=;
	b=SqYgSgRooyKUKa/Y+dWEKMBRiPff6FNrTbTS23pKGiWLfriuOPB0wutxoopRMJTN
	qobwkV9UWBlPoU7tj9PCW62NgDeQ07E09itZ56B/Am5Aq9t4Dew1eoB0Y2D6E9T4fgM
	t6CqcxCZCC1IyidF5pFcqGYPLSnYqnJIrVPovqO0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416050;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HIsGmOJogfkg/XVd0r14VLmYBwMVs/vprYcSoaTdtyg=;
	b=omhQme/LNft6Vkn5RdeJeNFEY50USS/kYRxk8bZ6uyzQaCJ59MPOxv2s4lDabAmW
	DP7BBeknWCZCqsJ71XTVWy28rqoqk9OJqHGHMJaN4ijoTqXOaxZPI2xeEON0BN8ALWo
	NXpP/5OcIGuS9rYwuOIG4OCJPCicmzYBjVVfAoyk=
Content-Type: multipart/mixed; boundary="===============2374555350960137459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 67b9be6429d7b01e9e6057ead013e7049e34b273 SUCCEEDED
Message-ID: <01010194c1abd159-f2c132e9-3e65-44ed-99e8-3aa0e56e5760-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210530

--===============2374555350960137459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *67b9be6429d7b01e9e6057ead013e7049e34b273* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From 80683cd2036fbfbf6d89c6218b075d2917dd329b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 07:54:21 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 7bf21a1fe2..9f9cc967c0 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "523d8f3cfb219d800f45860892e742e3a355f1bb"
+SRCREV = "67b9be6429d7b01e9e6057ead013e7049e34b273"
 
 PV = "0.1+git"
 
-- 
2.44.1


--===============2374555350960137459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+523d8f3cfb-r0'])", added "mmc-utils (['= 0.1+git0+67b9be6429-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+523d8f3cfb-r0'])", added "mmc-utils-dev (['= 0.1+git0+67b9be6429-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429

--===============2374555350960137459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+523d8f3cfb-r0'])", added "mmc-utils (['= 0.1+git0+67b9be6429-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+523d8f3cfb-r0'])", added "mmc-utils-dev (['= 0.1+git0+67b9be6429-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+523d8f3cfb to 0.1+git0+67b9be6429

--===============2374555350960137459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1b580a03757a9f6804feabd9292274dbb627b327"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 145 Local 134 Mirrors 0 Missed 11 Current 333 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 476 of 478 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_recipe_qa_setscene)
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1480 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 1481 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 1482 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: Running task 1484 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 1485 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1486 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic unihash changed to 76213182aba340856010169a91bbdcad927a49ad5c704133aef971a5d6d4ad00
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1487 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+git-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 1491 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot unihash changed to fd5df3622c697ab6cfd81dc9809adda2894e908c735ff187654ffee1e0b88fba
NOTE: Setscene tasks completed
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1499 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1492 tasks of which 1479 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201075335.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201075335.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata.3089502
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+523d8f3cfb-r0 to 0:0.1+git0+67b9be6429-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata.3089502
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============2374555350960137459==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSA4MDY4M2NkMjAzNmZiZmJmNmQ4OWM2MjE4YjA3NWQyOTE3ZGQzMjliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNzo1NDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IDdiZjIxYTFmZTIuLjlmOWNjOTY3YzAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gIjUyM2Q4ZjNjZmIyMTlkODAwZjQ1ODYw
ODkyZTc0MmUzYTM1NWYxYmIiCitTUkNSRVYgPSAiNjdiOWJlNjQyOWQ3YjAxZTllNjA1N2VhZDAx
M2U3MDQ5ZTM0YjI3MyIKIAogUFYgPSAiMC4xK2dpdCIKIAotLSAKMi40NC4xCgo=

--===============2374555350960137459==--

