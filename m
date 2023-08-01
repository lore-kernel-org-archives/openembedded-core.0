Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F13C07E8B
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.17598.1690907330289249337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AELgmXWf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c6jRIwL0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189b1ee4421-0abd3aa8-548b-4064-904e-d4d9ecb35f36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9vJ/FdUHWV/rxzCqHsxFY/IuHmELys7waYfWjU7r7a0=;
	b=AELgmXWf7JwbNX3TBpBbFlDiQ2FFyKEj+rjiZIo2XpdsAX5guG/XEK7Thne/JD24
	Hc3kjnHHnVj23d+Sz1GBbOikhwb8AM/u3QRBDalO1xuBFkh7etSI0Iz6bL4SsCeIqh6
	eeiRvnIBo7LtTpEBoqaBz9bC9rXVVlMf+MHvH9os=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9vJ/FdUHWV/rxzCqHsxFY/IuHmELys7waYfWjU7r7a0=;
	b=c6jRIwL0f2aJa9FW3rq4JJotIzT9mhDQLz/8FYloL25I9WGbc33biTMPs5kQ37Vn
	ZdWLEqLM7gx3UylvQ7lsXH4+hjYaMCbOd1AVMMEcpxg7FNvL7D44eI3bauEsAgsfZMo
	bWP9rUoOgJ1RNPz3xH+MvGw8pUAdXQ0NSYPtFxME=
Content-Type: multipart/mixed; boundary="===============4251125595624002538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 6d593efc3cd00e4debd0ffc5806246390dc66242 SUCCEEDED
Message-ID: <01010189b1ee4421-0abd3aa8-548b-4064-904e-d4d9ecb35f36-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185280

--===============4251125595624002538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *6d593efc3cd00e4debd0ffc5806246390dc66242* has Succeeded.

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
From 209a750f6436490597ba16cf99d43d10def2e989 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 09:40:05 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 373ada2026..9e1dcc2b9b 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "958227890690290ee766aaad1b92f3413f67048c"
+SRCREV = "6d593efc3cd00e4debd0ffc5806246390dc66242"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.39.2


--===============4251125595624002538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+9582278906 [default] to 0.1+gitAUTOINC+6d593efc3c [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 243692 to 243696 (+0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+9582278906-r0'])", added "mmc-utils (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 216257 to 216018 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+9582278906-r0'])", added "mmc-utils-dev (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+9582278906" to "0.1+gitAUTOINC+6d593efc3c"

--===============4251125595624002538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fdc52d4a2eb16c3c40fb6df6e6e71d7668a7fb1e"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 26 Mirrors 0 Missed 10 Current 238 (72% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 771 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_recipe_qa)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_recipe_qa: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_recipe_qa: Succeeded
NOTE: Running task 815 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_fetch: Succeeded
NOTE: Running task 816 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 817 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_unpack: Succeeded
NOTE: Running task 818 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: Running task 819 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_collect_spdx_deps: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_patch: Succeeded
NOTE: Running task 820 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 821 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_lic: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 822 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_configure: Succeeded
NOTE: Running task 823 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_compile: Succeeded
NOTE: Running task 824 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_install: Succeeded
NOTE: Running task 825 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 826 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_package: Succeeded
NOTE: Running task 827 of 832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 827 tasks of which 813 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+9582278906-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+6d593efc3c-r0/temp/log.do_packagedata.3107395
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============4251125595624002538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAyMDlhNzUwZjY0MzY0OTA1OTdiYTE2Y2Y5OWQ0M2QxMGRlZjJlOTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAwOTo0MDowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IDM3M2FkYTIwMjYuLjllMWRjYzJiOWIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gIjk1ODIyNzg5MDY5MDI5MGVlNzY2YWFh
ZDFiOTJmMzQxM2Y2NzA0OGMiCitTUkNSRVYgPSAiNmQ1OTNlZmMzY2QwMGU0ZGViZDBmZmM1ODA2
MjQ2MzkwZGM2NjI0MiIKIAogUFYgPSAiMC4xK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============4251125595624002538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+9582278906-r0'])", added "mmc-utils (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+9582278906-r0'])", added "mmc-utils-dev (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+9582278906 to 0.1+git0+6d593efc3c

--===============4251125595624002538==--

