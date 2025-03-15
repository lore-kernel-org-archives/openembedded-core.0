Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F0DC35FFC
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10326.1742048290056029441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NnITzRw2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eiXdnCZW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2b7c3d-07f5077f-11f3-49a9-baba-4ca03009bf31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U2cPdQFntmJQLLo2aJRumL4KIbdCqaahyJ80QrwfCvM=;
	b=NnITzRw22kNmEMjNbFFxO9qYv+X9Z185MA6qepSvPHzLfd+/YOR+NJKvyfmNLiUd
	Jj0L0EWVloW0KWzqyj4HEVgpgiICA6ujmmBu1Bk6PlFXVjpEOle/pDZZ44Hfttpb/2/
	IhIvD0nllHKGPFHsfXsoLmo/Fk9AdX60cf8h67v8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U2cPdQFntmJQLLo2aJRumL4KIbdCqaahyJ80QrwfCvM=;
	b=eiXdnCZWs2Qwmg7Os8JDOSM8bGDQFIo5SgsvXZc9Otii5KTLBb8HY+QtF+FjjKWG
	L6yre7OgBhclkAxhxDjf8tWF2hCn5bNWpG8OpeeicTdvE0RRYkiI1C4u46g9eHj3iiv
	l6Mm7b6EWYRVle6gj9LfGJqxOKvZsjIAnsBF0Yvw=
Content-Type: multipart/mixed; boundary="===============9029106155267491621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa SUCCEEDED
Message-ID: <010101959a2b7c3d-07f5077f-11f3-49a9-baba-4ca03009bf31-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212900

--===============9029106155267491621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa* has Succeeded.

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
From 7fe719bc436afa4bc694de0d85ef69a77fdaa5cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 08:58:03 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 9f9cc967c0..a5e9d53deb 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "67b9be6429d7b01e9e6057ead013e7049e34b273"
+SRCREV = "2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa"
 
 PV = "0.1+git"
 
-- 
2.44.1


--===============9029106155267491621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:b76e63eec2ffb71bb6b60bf3198c01f6595cda63"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 149 Local 138 Mirrors 0 Missed 11 Current 344 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 493 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_recipe_qa_setscene)
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1225 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 1520 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 1521 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 1522 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: Running task 1523 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic unihash changed to 76213182aba340856010169a91bbdcad927a49ad5c704133aef971a5d6d4ad00
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1526 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+git-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 1530 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot unihash changed to 1bfe871d5b460c228cc5492a3adf55005c1398ff636d2330621552f2fd2ea43f
NOTE: Setscene tasks completed
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1531 tasks of which 1518 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315085715.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315085715.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata.2663733
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+67b9be6429-r0 to 0:0.1+git0+2aef4cd9a8-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata.2663733
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============9029106155267491621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSA3ZmU3MTliYzQzNmFmYTRiYzY5NGRlMGQ4NWVmNjlhNzdmZGFhNWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDg6NTg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCA5ZjljYzk2N2MwLi5hNWU5ZDUzZGViIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICI2N2I5YmU2NDI5ZDdiMDFlOWU2MDU3
ZWFkMDEzZTcwNDllMzRiMjczIgorU1JDUkVWID0gIjJhZWY0Y2Q5YTg0ZGRjNzYzNDlmYzBkN2Ux
MGQ2NzVlN2ZhNTk2ZmEiCiAKIFBWID0gIjAuMStnaXQiCiAKLS0gCjIuNDQuMQoK

--===============9029106155267491621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 349248 to 351360 (+1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+67b9be6429-r0'])", added "mmc-utils (['= 0.1+git0+2aef4cd9a8-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 218940 to 220251 (+1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+67b9be6429-r0'])", added "mmc-utils-dev (['= 0.1+git0+2aef4cd9a8-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 119504 to 123600 (+3%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8

--===============9029106155267491621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+67b9be6429-r0'])", added "mmc-utils (['= 0.1+git0+2aef4cd9a8-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+67b9be6429-r0'])", added "mmc-utils-dev (['= 0.1+git0+2aef4cd9a8-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+67b9be6429 to 0.1+git0+2aef4cd9a8

--===============9029106155267491621==--

