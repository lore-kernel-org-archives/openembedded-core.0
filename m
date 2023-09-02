Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C9DCCF98E
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:26 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5661.1693650551600107115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O0xwdiDH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MLVAlHJj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a55709349-21eb923c-ffc7-4741-8c88-0c916b0ffd19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z+srq5YR8X92KHmmVyAXpLH5LLxVRQkkkVXVwma8wk8=;
	b=O0xwdiDH8a1qTrF/QyBK7lQpSooD3EGGZFklYYWOsQbVvZrppeZIFiIrslD+WWTI
	Bpm0h7EyfXZGV9aGQRKm3yAXJIcb6ltMQfI61NrcNB4UvGXyH1o08pQXR5oaSqIplJg
	lX+AxTNJCeoDu7O+OIMAHthzl8aoGIStvfpp6/EE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z+srq5YR8X92KHmmVyAXpLH5LLxVRQkkkVXVwma8wk8=;
	b=MLVAlHJj/OHLN6oSNqhHMiPv/kZ1y093w7Tmd+1SfZ5TE4CeC4k8SE5CgkqUzFcS
	95e5I9Q/tYGoyHCjjPT+KSSq/B+qXJzNs7PJiQDsORshmV/jVW/ZnU3IVUnb8opl1zn
	8dByrI7k14AiMZ4+Rhp+t5EN03Wjz6vN6AUJCpno=
Content-Type: multipart/mixed; boundary="===============1342022939562559910=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 67496e74f68db900d8117be6de3c75285c29c489
 SUCCEEDED
Message-ID: <0101018a55709349-21eb923c-ffc7-4741-8c88-0c916b0ffd19-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187125

--===============1342022939562559910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *67496e74f68db900d8117be6de3c75285c29c489* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From a8afab650c00379a7c06e70c6d8a7c59aeed9a44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 04:12:47 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 04338a603b..c44e940e81 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
+SRCREV = "67496e74f68db900d8117be6de3c75285c29c489"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.39.2


--===============1342022939562559910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 15550008 to 15716568 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles (['= 2:0.0+git0+67496e74f6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: added "/usr/src/debug/puzzles/2_0.0+git-r0/spectre.h /usr/src/debug/puzzles/2_0.0+git-r0/penrose-internal.h /usr/src/debug/puzzles/2_0.0+git-r0/spectre-tables-manual.h /usr/src/debug/puzzles/2_0.0+git-r0/spectre.c /usr/src/debug/puzzles/2_0.0+git-r0/spectre-internal.h /usr/src/debug/puzzles/2_0.0+git-r0/penrose-legacy.h /usr/src/debug/puzzles/2_0.0+git-r0/spectre-tables-auto.h /usr/src/debug/puzzles/2_0.0+git-r0/penrose-legacy.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3692462 to 3837715 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles-dev (['= 2:0.0+git0+67496e74f6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7454150 to 7523782 (+1%)

--===============1342022939562559910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-dedfa71e2545919d6b26a98d2f398016f04359b2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dedfa71e2545919d6b26a98d2f398016f04359b2"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 324 Local 314 Mirrors 0 Missed 10 Current 658 (96% match, 98% complete)
Removing 8 stale sstate objects for arch core2-32...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2403 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2661 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2662 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2664 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2666 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2667 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 89270a2b0a6e9abbb4fea3a23156f4783c081a9eab2f30ab16f2e901ad9def0a
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2669 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2670 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2671 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2672 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to a564480a0d90cce49e051eb2ce2af1b3a08a8323225df583e12d42216e80bc49
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2673 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2673 tasks of which 2659 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+67496e74f6-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.18106
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============1342022939562559910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles (['= 2:0.0+git0+67496e74f6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles-dev (['= 2:0.0+git0+67496e74f6-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+67496e74f6

--===============1342022939562559910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBhOGFmYWI2NTBjMDAzNzlhN2MwNmU3MGM2ZDhhN2M1OWFlZWQ5YTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwNDoxMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCAwNDMzOGE2MDNiLi5jNDRlOTQwZTgxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gImI2Yzg0MmEyOGNmNjU5N2RmMDYzZmNmZjM1MDc5YzNl
Mzk4MjM4MWUiCitTUkNSRVYgPSAiNjc0OTZlNzRmNjhkYjkwMGQ4MTE3YmU2ZGUzYzc1Mjg1YzI5
YzQ4OSIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============1342022939562559910==--

