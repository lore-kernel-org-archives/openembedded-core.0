Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6C6CA1011
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.89794.1756850186663987349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R/FJszlM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RSIiGliv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101990c6e9d7e-71fb7e5c-7a21-4aee-b77f-f52b9979e784-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ch4J+B5HVx+bFWvkpkcAPjipyy/yy8XDfXC8UF8iVYQ=;
	b=R/FJszlM6p/usULkcE43/OkGcjgJpZyfiErlnYpjc6A78TIsUu32JmBdR23rLPi5
	uXfdhPzPZnas/1kUHMR+Wmrvgy+lv0hcYmNqAkjQ7fINVOKI6SOLtlZ0rq6Tm2Z1pBO
	+q0LlV2TYL+IE4+sX4A7+BPX3SdXt2T2s6Sr0DKE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ch4J+B5HVx+bFWvkpkcAPjipyy/yy8XDfXC8UF8iVYQ=;
	b=RSIiGlivqueE9mUqZgw4+SK45hFYCYnKhnxMBD74fhmZ66Oa8V61HH/Qgclmw5rq
	Lc1DFJAkaFy16kCI0Hifdqvd3gAi8ujUhK4NulS/2WIUW9YpAa3v244xZfwT+kc3ODC
	ASgZFv7I2RNj6byN9LegimFQQ+KdL1GcusUQy7v0=
Content-Type: multipart/mixed; boundary="===============7156710599717186092=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 2c1f2646c5e58d11b279b610a8509116c02b067b
 SUCCEEDED
Message-ID: <010101990c6e9d7e-71fb7e5c-7a21-4aee-b77f-f52b9979e784-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222810

--===============7156710599717186092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmscube* to *2c1f2646c5e58d11b279b610a8509116c02b067b* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From 479c691fd4f4bf7212060fed18a5f1214637b117 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 20:00:31 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index fbc7751830..243728b115 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
-SRCREV = "afedb4255f380bb2041dd2100ed7fb75487a96dd"
+SRCREV = "2c1f2646c5e58d11b279b610a8509116c02b067b"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            "
 
-- 
2.47.1


--===============7156710599717186092==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA0NzljNjkxZmQ0ZjRiZjcyMTIwNjBmZWQxOGE1ZjEyMTQ2MzdiMTE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMDowMDozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCBmYmM3NzUxODMwLi4yNDM3MjhiMTE1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0gdmlydHVhbC9saWJnYm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTJhMTJiZjdhNjZmNWY2NjNkNzUxODZiZjAxZWI2MDdiIgogCi1TUkNSRVYgPSAi
YWZlZGI0MjU1ZjM4MGJiMjA0MWRkMjEwMGVkN2ZiNzU0ODdhOTZkZCIKK1NSQ1JFViA9ICIyYzFm
MjY0NmM1ZTU4ZDExYjI3OWI2MTBhODUwOTExNmMwMmIwNjdiIgogU1JDX1VSSSA9ICJnaXQ6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Eva21zY3ViZTticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzIFwKICAgICAgICAgICAgIgogCi0tIAoyLjQ3LjEKCg==

--===============7156710599717186092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1940 targets, 45 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-825d7ceb764bf1a2b98181be1b0f2242ab521c3f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:825d7ceb764bf1a2b98181be1b0f2242ab521c3f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 351 Local 340 Mirrors 0 Missed 11 Current 602 (96% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2351 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_fetch)
NOTE: recipe kmscube-0.0.1+git-r0: task do_fetch: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 2650 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_unpack)
NOTE: Running task 2651 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmscube-0.0.1+git-r0: task do_unpack: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmscube-0.0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 2652 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_patch)
NOTE: Running task 2653 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_collect_spdx_deps)
NOTE: recipe kmscube-0.0.1+git-r0: task do_patch: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2655 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic)
NOTE: recipe kmscube-0.0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_lic: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_lic unihash changed to d11eac140933b1fc6a5e27bd556ec7ad98ced6be37fd2021198fcbe36da808ed
NOTE: recipe kmscube-0.0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2656 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
NOTE: recipe kmscube-0.0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmscube-0.0.1+git-r0: task do_configure: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 2657 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_compile)
NOTE: recipe kmscube-0.0.1+git-r0: task do_compile: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 2658 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_install)
NOTE: recipe kmscube-0.0.1+git-r0: task do_install: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_install: Succeeded
NOTE: Running task 2659 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_package)
NOTE: Running task 2660 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot)
NOTE: recipe kmscube-0.0.1+git-r0: task do_package: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot unihash changed to 6a5d9838892a101291cb2ba33e118fcaa6edbf8ec0865cb57f861d8f1f06e235
NOTE: Setscene tasks completed
NOTE: recipe kmscube-0.0.1+git-r0: task do_package: Succeeded
NOTE: Running task 2661 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-0.0.1+git-r0: task do_packagedata: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2661 tasks of which 2648 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902195932.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250902195932.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kmscube/0.0.1+git/temp/log.do_packagedata.1039906
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-src went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-dbg went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-staticdev went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-dev went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-doc went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-locale went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kmscube/0.0.1+git/temp/log.do_packagedata.1039906
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata) failed with exit code '1'

--===============7156710599717186092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-dev: RRECOMMENDS: removed "kmscube (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: RDEPENDS: removed "kmscube-dev (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube-dev (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5

--===============7156710599717186092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-dev: RRECOMMENDS: removed "kmscube (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: RDEPENDS: removed "kmscube-dev (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube-dev (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5

--===============7156710599717186092==--

