Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47953C54F47
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11038.1747312312590940612
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l2KbnG16;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l8u0PEQP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010196d3edfc5a-fc3526df-cb30-4500-b070-ddf7abd0922d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312312;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TirnMSzpUn0VIBR6+MPrxPS1kYLuAzCO87L9QfheY4U=;
	b=l2KbnG16zeP7FsfLNIdSasSPooB36p0m3ca+7zV/f2RMJNkc2MSfUvdIqaOZMwhc
	xzNFl1cmLFpY/0Fim30csQ7DeQ3MRxXiFi79jqFehgsUtJvXQUneMKHQYr+UAvYrnt/
	e7kiwEEmE4SyRGEeT35Iel9X+p4ysmAFypdcb1sI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312312;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TirnMSzpUn0VIBR6+MPrxPS1kYLuAzCO87L9QfheY4U=;
	b=l8u0PEQPszKSPXJTeU9hpyAzt+5nhEXQ6h6o20vmyKPJ7gR6jWhlAoFZE1F9zL7o
	bIuKH0KDQI5A/l6XnDvr7RAYA1fqzS3QPVhu0/4SRN2NTEVfTv74gwyB0IqLwYa5H07
	Wq2GSBm+yvqoCArxWR/iDw92bFtudp6L10VrvIKM=
Content-Type: multipart/mixed; boundary="===============0749803664937947372=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 a23ad7875b89df0dedc23f0b173926374f01bc76 SUCCEEDED
Message-ID: <01010196d3edfc5a-fc3526df-cb30-4500-b070-ddf7abd0922d-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216605

--===============0749803664937947372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *a23ad7875b89df0dedc23f0b173926374f01bc76* has Succeeded.

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
From 1f574397416554a051bc9e9a3a971d3f324f6640 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:46:32 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 1f287a8df9..043ac71846 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
+SRCREV = "a23ad7875b89df0dedc23f0b173926374f01bc76"
 
 PV = "0.1+git"
 
-- 
2.47.1


--===============0749803664937947372==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAxZjU3NDM5NzQxNjU1NGEwNTFiYzllOWEzYTk3MWQzZjMyNGY2NjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6NDY6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCAxZjI4N2E4ZGY5Li4wNDNhYzcxODQ2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJjNTE1ZWEyZTFjZWJmYmY5ZDgxYWE2
YTVjMWJmNjdhNzlkMmE3ZTU4IgorU1JDUkVWID0gImEyM2FkNzg3NWI4OWRmMGRlZGMyM2YwYjE3
MzkyNjM3NGYwMWJjNzYiCiAKIFBWID0gIjAuMStnaXQiCiAKLS0gCjIuNDcuMQoK

--===============0749803664937947372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 358888 to 354872 (-1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 227386 to 225668 (-1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils-dev (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 127984 to 127632 (-0%)

--===============0749803664937947372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils-dev (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b

--===============0749803664937947372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1916 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:fc58ddf015c4d8f378930d9eeb75c41ae4e75c48"

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
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch unihash changed to 4a0e4baebd70ab8cc13ff11b8ab9d5cad7b8628453cdfc79503be7e717ee54a4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic unihash changed to 76213182aba340856010169a91bbdcad927a49ad5c704133aef971a5d6d4ad00
NOTE: Setscene tasks completed
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot unihash changed to 14ad94e8e6c7ce50c374b9f78164b2ee98a05d277656bd8991f54d789da21733
NOTE: Setscene tasks completed
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1538 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1531 tasks of which 1518 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515074548.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515074548.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata.368242
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata.368242
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============0749803664937947372==--

