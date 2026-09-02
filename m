Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6A4C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:31:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5602.1788327109722003349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hm8giTMI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=158Jt1zZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0609a1f90-6c03981f-8515-4d57-a57d-ad1139f7d28c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788327108;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=5yos3hPIuOUyZC+f2Qpryv55N4cufNlNjT+IiYSVyiM=;
	b=hm8giTMI2woBus5orCcSkA45FfbSDB4dwRz6zGBx5nJQDjjitRSsPfKgHWfvmt2D
	fPh64sF7lvux1TRbL+43qRS4tZmH1vNT+E+Dc8vOksp5A2lP+6kNjD386wo4WU+uJec
	82gSf4ztmAwrGNXgAZ3BUfEVmBFnD61sHKWj/wCc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788327108;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=5yos3hPIuOUyZC+f2Qpryv55N4cufNlNjT+IiYSVyiM=;
	b=158Jt1zZHwCsXyM/pfBO7HTUkqBH81FLSbcCZyEsMHR+fJDBAbbicZYyLnLIk378
	LTiGEBUfNq3fYL/H8csOaizYN+FZ73TFsnPY2I+5smmBdVCfXG6eaKrkNNxyftAWRR3
	iogWgApzWj1k3RhPT9dAPoScVUQMrkPWYwYCU3OU=
Content-Type: multipart/mixed; boundary="===============0887922479883919600=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa-demos: upgrading to
 71b184c379625c91195f5d69186d4de5a1f642ac SUCCEEDED
Message-ID: <010101a0609a1f90-6c03981f-8515-4d57-a57d-ad1139f7d28c-000000@us-west-2.amazonses.com>
Date: Wed, 2 Sep 2026 05:31:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244885

--===============0887922479883919600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-demos* to *71b184c379625c91195f5d69186d4de5a1f642ac* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-demos-upgrade-to-latest-revision.patch
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
From 6f98ac94d1c353febe9f425250c9e75527036fca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 2 Sep 2026 05:31:40 +0000
Subject: [PATCH] mesa-demos: upgrade to latest revision

71b184c3 Add GL ES 1.0 CL version of gears
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index 784c2d4ad7..e945538c48 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 
-SRCREV = "10418e7636cdd9595dda18c3d78a562d7248f734"
+SRCREV = "71b184c379625c91195f5d69186d4de5a1f642ac"
 
 # This recipe doesn't plan to make more releases, so track upstream git commits
 PV .= "+git"
-- 
2.47.1


--===============0887922479883919600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mesa-demos-changelog.txt"

Changelog for mesa-demos: 9.0.0+git -> 9.0.0+git

71b184c3 Add GL ES 1.0 CL version of gears

--===============0887922479883919600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: RRECOMMENDS: removed "mesa-demos (['= 9.0.0+git0+10418e7636-r0'])", added "mesa-demos (['= 9.0.0+git0+71b184c379-r0'])"
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: RDEPENDS: removed "mesa-demos-dev (['= 9.0.0+git0+10418e7636-r0'])", added "mesa-demos-dev (['= 9.0.0+git0+71b184c379-r0'])"
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379

--===============0887922479883919600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e2a7243bbfd836fa52a5a9e935c29d9e32aaf535"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e2a7243bbfd836fa52a5a9e935c29d9e32aaf535"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 591 Local 580 Mirrors 0 Missed 11 Current 523 (98% match, 99% complete)
done.
Removing 10 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2408 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_fetch)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_fetch: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2629 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_unpack)
NOTE: Running task 2630 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_unpack: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2631 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_patch)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_patch: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2632 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2633 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_lic)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_lic unihash changed to a1b2ea3938feadfad4263faf11ecb44641c697bf6630b0f4b90869836901e593
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2634 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_configure)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_configure: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2635 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_compile)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_compile: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2636 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_install)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_install: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2637 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_package)
NOTE: Running task 2638 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_sysroot)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_package: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_populate_sysroot unihash changed to 99e056f47e080efe1f942641d6f278f3a49a8530678c0d02d3e283980c144cf4
NOTE: Setscene tasks completed
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2639 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata)
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-9.0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2639 tasks of which 2627 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260902052822.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260902052822.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/mesa-demos/9.0.0+git/temp/log.do_packagedata.1059425
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-src went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-dbg went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-staticdev went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-dev went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-doc went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-locale went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos-info went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: QA Issue: Package version for package mesa-demos went backwards which would break package feeds (from 0:9.0.0+git0+10418e7636-r0 to 0:9.0.0+git0+71b184c379-r0) [version-going-backwards]
ERROR: mesa-demos-9.0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/mesa-demos/9.0.0+git/temp/log.do_packagedata.1059425
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb:do_packagedata) failed with exit code '1'

--===============0887922479883919600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dbg: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: RRECOMMENDS: removed "mesa-demos (['= 9.0.0+git0+10418e7636-r0'])", added "mesa-demos (['= 9.0.0+git0+71b184c379-r0'])"
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-dev: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-doc: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-info: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-locale: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-src: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: RDEPENDS: removed "mesa-demos-dev (['= 9.0.0+git0+10418e7636-r0'])", added "mesa-demos-dev (['= 9.0.0+git0+71b184c379-r0'])"
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos-staticdev: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379
packages/x86-64-v3-poky-linux/mesa-demos/mesa-demos: PKGV changed from 9.0.0+git0+10418e7636 to 9.0.0+git0+71b184c379

--===============0887922479883919600==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-demos-upgrade-to-latest-revision.patch"

RnJvbSA2Zjk4YWM5NGQxYzM1M2ZlYmU5ZjQyNTI1MGM5ZTc1NTI3MDM2ZmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMiBTZXAgMjAyNiAwNTozMTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EtZGVtb3M6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgo3MWIxODRjMyBBZGQgR0wgRVMg
MS4wIENMIHZlcnNpb24gb2YgZ2VhcnMKLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9t
ZXNhLWRlbW9zXzkuMC4wLmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYS1kZW1vc185LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtZGVt
b3NfOS4wLjAuYmIKaW5kZXggNzg0YzJkNGFkNy4uZTk0NTUzOGM0OCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1kZW1vc185LjAuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLWRlbW9zXzkuMC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBA
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3NyYy94ZGVtb3MvZ2x4Z2VhcnMuYztiZWdpbmxp
bmU9MTtlbmRsaW5lPTU7bWQ1PTJjNDU2CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9tZXNhL2RlbW9zLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKIAot
U1JDUkVWID0gIjEwNDE4ZTc2MzZjZGQ5NTk1ZGRhMThjM2Q3OGE1NjJkNzI0OGY3MzQiCitTUkNS
RVYgPSAiNzFiMTg0YzM3OTYyNWM5MTE5NWY1ZDY5MTg2ZDRkZTVhMWY2NDJhYyIKIAogIyBUaGlz
IHJlY2lwZSBkb2Vzbid0IHBsYW4gdG8gbWFrZSBtb3JlIHJlbGVhc2VzLCBzbyB0cmFjayB1cHN0
cmVhbSBnaXQgY29tbWl0cwogUFYgLj0gIitnaXQiCi0tIAoyLjQ3LjEKCg==

--===============0887922479883919600==--

