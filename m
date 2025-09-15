Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C379ACCD18A
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.30884.1757937276286159986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=02vzDuwo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fgQ/bGpB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a4f99-20e8be3f-fa97-4e99-ac83-cdbcf4925842-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9OeNd45UVuk69BB/I1VhsbYXFX2bV0cJQa8tf1eXrQU=;
	b=02vzDuwocO91MkdVYnHyfVzHD4BC82WiSIpRjZCx1wTgU7aQvMqpFCYeyqWDFB42
	kUEN0/KhujtqaNdwS6KpGkQe/9WbU12lF/l4RMD025fJoZavdKN1zPsjmwNTH7z6HRX
	w99yP0txX3nESR9BdOA3qpAogkID4PZeTObAqIXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9OeNd45UVuk69BB/I1VhsbYXFX2bV0cJQa8tf1eXrQU=;
	b=fgQ/bGpB0ot0LQt+ivc5GnCDzmtNYCghd32vv6kfMu9NNTwBsBXu5iEvewTtgSgR
	x+1pa9Z1w7RCEpWibeXfOQ3fRt3i3tsLxCrbXSpwWlZxpWyZaMXKG9Y+donFe+xJ3eD
	JxLtJ+UC/2ZvCR1iAH5xlFmspaeKpoZYEiD4ruqs=
Content-Type: multipart/mixed; boundary="===============7291602982224647603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 2c1f2646c5e58d11b279b610a8509116c02b067b
 SUCCEEDED
Message-ID: <010101994d3a4f99-20e8be3f-fa97-4e99-ac83-cdbcf4925842-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223458

--===============7291602982224647603==
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
From db6fbe335468ae6c594535c069fa1be7684e81ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 10:08:43 +0000
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


--===============7291602982224647603==
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
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: RDEPENDS: removed "kmscube-dev (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube-dev (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5

--===============7291602982224647603==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSBkYjZmYmUzMzU0NjhhZTZjNTk0NTM1YzA2OWZhMWJlNzY4NGU4MWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTA6MDg6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggZmJjNzc1MTgzMC4uMjQzNzI4YjExNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIHZpcnR1YWwvbGliZ2JtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT0yYTEyYmY3YTY2ZjVmNjYzZDc1MTg2YmYwMWViNjA3YiIKIAotU1JDUkVWID0g
ImFmZWRiNDI1NWYzODBiYjIwNDFkZDIxMDBlZDdmYjc1NDg3YTk2ZGQiCitTUkNSRVYgPSAiMmMx
ZjI2NDZjNWU1OGQxMWIyNzliNjEwYTg1MDkxMTZjMDJiMDY3YiIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1YmU7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCiAgICAgICAgICAgICIKIAotLSAKMi40Ny4xCgo=

--===============7291602982224647603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fee49d883b404d4e678ad4627704c45ce27be895"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fee49d883b404d4e678ad4627704c45ce27be895"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 369 Local 360 Mirrors 0 Missed 9 Current 584 (97% match, 99% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 871 of 953 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmscube-0.0.1+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
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
NOTE: recipe kmscube-0.0.1+git-r0: task do_patch: Succeeded
NOTE: recipe kmscube-0.0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2655 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_configure)
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_populate_sysroot unihash changed to 8810e79294867c9d4da044f2bc1e386c3bbde4cbef691d97760eeb84dced5c70
NOTE: Setscene tasks completed
NOTE: recipe kmscube-0.0.1+git-r0: task do_package: Succeeded
NOTE: Running task 2661 of 2668 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata)
NOTE: recipe kmscube-0.0.1+git-r0: task do_packagedata: Started
NOTE: recipe kmscube-0.0.1+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2661 tasks of which 2650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915100749.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915100749.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kmscube/0.0.1+git/temp/log.do_packagedata.996918
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-src went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-dbg went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-staticdev went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-dev went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-doc went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube-locale went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: QA Issue: Package version for package kmscube went backwards which would break package feeds (from 0:0.0.1+git0+afedb4255f-r0 to 0:0.0.1+git0+2c1f2646c5-r0) [version-going-backwards]
ERROR: kmscube-0.0.1+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/kmscube/0.0.1+git/temp/log.do_packagedata.996918
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/kmscube/kmscube_git.bb:do_packagedata) failed with exit code '1'

--===============7291602982224647603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-dev: RRECOMMENDS: removed "kmscube (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: RDEPENDS: removed "kmscube-dev (['= 0.0.1+git0+afedb4255f-r0'])", added "kmscube-dev (['= 0.0.1+git0+2c1f2646c5-r0'])"
packages/x86-64-v3-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5
packages/x86-64-v3-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+afedb4255f to 0.0.1+git0+2c1f2646c5

--===============7291602982224647603==--

