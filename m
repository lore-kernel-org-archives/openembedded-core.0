Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC69C2FC00
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.827.1686887483426073753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Oa6Vmd/R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544388-5ec761b9-5f72-4274-b6a1-03564e80c546-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GfwT9bFcVkXkCd+mgJIwgwzDLBchc44IL6LUoQMrtzg=;
	b=Oa6Vmd/R4pDdBQQq1enRK0nEBe3zPsj8FvvgPj0gS7ylVwC00AyTv0Be8SvzOv3a
	Ys+2p16ChDsspVYSsJOyM0Dg7bnP+18no1VD1zlhFX78vazWVU7M4SdpuBYxJexwEr5
	n3u/NXSMLiu8Lbjf6AF+yMAZnlap2pQD3etqkV1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GfwT9bFcVkXkCd+mgJIwgwzDLBchc44IL6LUoQMrtzg=;
	b=dCaXBlfH5hr7LDNTYKnLt8nl4XeGA1mRVV+pfkGrEvQL57VPYRoWmefvXNrDa1h/
	skUN9MjIM0HpmoGDlQE7FUESORr+1auP+7hhTsBu8124STYzsfsqHulOlXgJ2UNKvVB
	DzLu1zvUcyyrJm77v5M+hsvgyA6AUtEHgqvMFlmg=
Content-Type: multipart/mixed; boundary="===============4215763126401946262=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 6d593efc3cd00e4debd0ffc5806246390dc66242 SUCCEEDED
Message-ID: <01010188c2544388-5ec761b9-5f72-4274-b6a1-03564e80c546-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182922

--===============4215763126401946262==
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
From ab46e9f200968b2e18b78aaf1ae91d99312d20e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 12:01:19 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 1e2e17bfd3..9e1dcc2b9b 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "d4c2910981ff99b983734426dfa99632fb81ac6b"
+SRCREV = "6d593efc3cd00e4debd0ffc5806246390dc66242"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.39.2


--===============4215763126401946262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:623275465d168990b00d1b5c066ac60bf02e5025"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 21 Mirrors 0 Missed 9 Current 168 (70% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 697 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_fetch: Succeeded
NOTE: Running task 740 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 741 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_unpack: Succeeded
NOTE: Running task 742 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: Running task 743 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_collect_spdx_deps: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_patch: Succeeded
NOTE: Running task 744 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 745 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 746 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_lic: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_configure: Succeeded
NOTE: Running task 747 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_compile: Succeeded
NOTE: Running task 748 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_install: Succeeded
NOTE: Running task 749 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 750 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_package: Succeeded
NOTE: Running task 751 of 756 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 751 tasks of which 738 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+6d593efc3c-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+6d593efc3c-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+6d593efc3c-r0/temp/log.do_packagedata.847015
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============4215763126401946262==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSBhYjQ2ZTlmMjAwOTY4YjJlMThiNzhhYWYxYWU5MWQ5OTMxMmQyMGU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTI6MDE6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCAxZTJlMTdiZmQzLi45ZTFkY2MyYjliIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJkNGMyOTEwOTgxZmY5OWI5ODM3MzQ0
MjZkZmE5OTYzMmZiODFhYzZiIgorU1JDUkVWID0gIjZkNTkzZWZjM2NkMDBlNGRlYmQwZmZjNTgw
NjI0NjM5MGRjNjYyNDIiCiAKIFBWID0gIjAuMStnaXQke1NSQ1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============4215763126401946262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+d4c2910981 [default] to 0.1+gitAUTOINC+6d593efc3c [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 243720 to 243708 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 216175 to 216018 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils-dev (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 143172 to 143204 (+0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+6d593efc3c"

--===============4215763126401946262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils-dev (['= 0.1+git0+6d593efc3c-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+6d593efc3c

--===============4215763126401946262==--

