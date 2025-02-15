Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137CAC19778
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8054.1739623332497518071
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=j6DngdjN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mJd83A1g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019509a17c7d-ff864506-c276-4b3f-81dd-c7a4b8ca74f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tOoccM/o2zq0rR2OEZFYF8mW7gzzHkridb0m+tJuarw=;
	b=j6DngdjNkXYqvk8r52fEleu+iDJXjIqYbX4K+omS6e74XnPd0FuPfb8IsgLt7kd+
	dK6VvdgciIg1/gcTNIJpXiBK42HAvW5OmNggCp9AesZnbkJ2hyulueXmWNQB88xPkzf
	wXOwGdmTCAR5msFHBtt24Xuw9rt4kbR35bmnmGj0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tOoccM/o2zq0rR2OEZFYF8mW7gzzHkridb0m+tJuarw=;
	b=mJd83A1gmHDGFXVgLlKb44L1BH5herHWe4EJFY9SfLBWW71Huw67ek5lImI1L+aS
	FIRQInJZP0lpu82yT8BXTY1axdlbEmUKkVIz+67yoPA8vf58TWUtrhvyaFqHb5ZZfci
	l7fy0qSTqASmVDaOH9LtolnCkhT8GvXC9XjfIAzU=
Content-Type: multipart/mixed; boundary="===============0215151209961939695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psplash: upgrading to 5a32cf6392c784a7ae1983a354cf07b024625cd2
 SUCCEEDED
Message-ID: <0101019509a17c7d-ff864506-c276-4b3f-81dd-c7a4b8ca74f8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211410

--===============0215151209961939695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *psplash* to *5a32cf6392c784a7ae1983a354cf07b024625cd2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psplash-upgrade-to-latest-revision.patch
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
From b8ead94d37ef81d403abd2b41bdd8bc7acee63cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:54:57 +0000
Subject: [PATCH] psplash: upgrade to latest revision

---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 30cf61a2cb..c70c266066 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "ecc1913756698d0c87ad8fa10e44b29537f09ad1"
+SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
-- 
2.44.1


--===============0215151209961939695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1869 targets, 38 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:5d632bd3d151de81bf2d5ee0f96c2b6b041cbca6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 277 Local 266 Mirrors 0 Missed 11 Current 452 (96% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1749 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_fetch)
NOTE: recipe psplash-0.1+git-r0: task do_fetch: Started
NOTE: recipe psplash-0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 2033 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_unpack)
NOTE: Running task 2034 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe psplash-0.1+git-r0: task do_unpack: Started
NOTE: recipe psplash-0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psplash-0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psplash-0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 2035 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_patch)
NOTE: Running task 2036 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_collect_spdx_deps)
NOTE: recipe psplash-0.1+git-r0: task do_patch: Started
NOTE: recipe psplash-0.1+git-r0: task do_patch: Succeeded
NOTE: recipe psplash-0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2037 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2038 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_populate_lic)
NOTE: recipe psplash-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe psplash-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe psplash-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe psplash-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_populate_lic unihash changed to d1e3caff91aaf1d1a3c8987a77b9b29e422887b2a2e7cb71be1a93427f4d3561
NOTE: recipe psplash-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2039 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_configure)
NOTE: recipe psplash-0.1+git-r0: task do_configure: Started
NOTE: recipe psplash-0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 2040 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_compile)
NOTE: recipe psplash-0.1+git-r0: task do_compile: Started
NOTE: recipe psplash-0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 2041 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_install)
NOTE: recipe psplash-0.1+git-r0: task do_install: Started
NOTE: recipe psplash-0.1+git-r0: task do_install: Succeeded
NOTE: Running task 2042 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_package)
NOTE: Running task 2043 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_populate_sysroot)
NOTE: recipe psplash-0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe psplash-0.1+git-r0: task do_package: Started
NOTE: recipe psplash-0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_populate_sysroot unihash changed to 265b3c568ce521236dffe001c997f7b4315049ef6ca31c65ab968d16bb74c174
NOTE: Setscene tasks completed
NOTE: recipe psplash-0.1+git-r0: task do_package: Succeeded
NOTE: Running task 2044 of 2051 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_packagedata)
NOTE: recipe psplash-0.1+git-r0: task do_packagedata: Started
NOTE: recipe psplash-0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2044 tasks of which 2031 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215065403.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215065403.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/psplash/0.1+git/temp/log.do_packagedata.2682562
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-src went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-dbg went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-default went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-staticdev went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-dev went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-doc went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash-locale went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: QA Issue: Package version for package psplash went backwards which would break package feeds (from 0:0.1+git0+ecc1913756-r0 to 0:0.1+git0+5a32cf6392-r0) [version-going-backwards]
ERROR: psplash-0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/psplash/0.1+git/temp/log.do_packagedata.2682562
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/psplash/psplash_git.bb:do_packagedata) failed with exit code '1'

--===============0215151209961939695==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-psplash-upgrade-to-latest-revision.patch"

RnJvbSBiOGVhZDk0ZDM3ZWY4MWQ0MDNhYmQyYjQxYmRkOGJjN2FjZWU2M2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6NTQ6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c3BsYXNoOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtY29y
ZS9wc3BsYXNoL3BzcGxhc2hfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvcHNw
bGFzaC9wc3BsYXNoX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3BzcGxhc2gvcHNwbGFzaF9n
aXQuYmIKaW5kZXggMzBjZjYxYTJjYi4uYzcwYzI2NjA2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvcHNwbGFzaC9wc3BsYXNoX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9w
c3BsYXNoL3BzcGxhc2hfZ2l0LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAt
b3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9wc3BsYXNoLmg7YmVnaW5saW5l
PTE7ZW5kbGluZT04O21kNT04ZjIzMmMxZTk1OTI5ZWFjYWIzN2YwMDkwMDU4MDIyNCIKIERFUEVO
RFMgPSAiZ2RrLXBpeGJ1Zi1uYXRpdmUiCiAKLVNSQ1JFViA9ICJlY2MxOTEzNzU2Njk4ZDBjODdh
ZDhmYTEwZTQ0YjI5NTM3ZjA5YWQxIgorU1JDUkVWID0gIjVhMzJjZjYzOTJjNzg0YTdhZTE5ODNh
MzU0Y2YwN2IwMjQ2MjVjZDIiCiBQViA9ICIwLjErZ2l0IgogCiBTUkNfVVJJID0gImdpdDovL2dp
dC55b2N0b3Byb2plY3Qub3JnLyR7QlBOfTticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwK
LS0gCjIuNDQuMQoK

--===============0215151209961939695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/psplash/psplash-dbg: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-dbg: PKGSIZE changed from 155056 to 155040 (-0%)
packages/core2-64-poky-linux/psplash/psplash-default: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-dev: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-dev: RRECOMMENDS: removed "psplash (['= 0.1+git0+ecc1913756-r0'])", added "psplash (['= 0.1+git0+5a32cf6392-r0'])"
packages/core2-64-poky-linux/psplash/psplash-doc: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-locale: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-src: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-src: PKGSIZE changed from 117530 to 117569 (+0%)
packages/core2-64-poky-linux/psplash/psplash-staticdev: RDEPENDS: removed "psplash-dev (['= 0.1+git0+ecc1913756-r0'])", added "psplash-dev (['= 0.1+git0+5a32cf6392-r0'])"
packages/core2-64-poky-linux/psplash/psplash-staticdev: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392

--===============0215151209961939695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/psplash/psplash-dbg: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-default: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-dev: RRECOMMENDS: removed "psplash (['= 0.1+git0+ecc1913756-r0'])", added "psplash (['= 0.1+git0+5a32cf6392-r0'])"
packages/core2-64-poky-linux/psplash/psplash-dev: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-doc: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-locale: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-src: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash-staticdev: RDEPENDS: removed "psplash-dev (['= 0.1+git0+ecc1913756-r0'])", added "psplash-dev (['= 0.1+git0+5a32cf6392-r0'])"
packages/core2-64-poky-linux/psplash/psplash-staticdev: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392
packages/core2-64-poky-linux/psplash/psplash: PKGV changed from 0.1+git0+ecc1913756 to 0.1+git0+5a32cf6392

--===============0215151209961939695==--

