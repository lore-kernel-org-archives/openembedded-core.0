Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1736CD4F50
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34825.1778851229016945499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iBHy4H1K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q7NnWsAY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e2bcbab30-60865412-6550-4303-859e-746d619586cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J3aopluD1HPlkuIh+G+H3bNahrW+u/Nz/KoTk07b60Q=;
	b=iBHy4H1KAR8SCENdT9XLE65ermgQQeJ4+ITMMeu1Xrd3ubgGtlH4Ce7ysIAMSV0i
	85bQqgsdbZOTCR+QsnstpmD2S+KG3myzXDO424YpqdADfDyCsEKTET3v90yV4kbMP1T
	yTTyBAneM/cBNLDAakDSeYBzWkHKWZ2u01f6dK0w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851228;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J3aopluD1HPlkuIh+G+H3bNahrW+u/Nz/KoTk07b60Q=;
	b=Q7NnWsAYAntHCsPFf3oICS9Y5wumXa0DzGmbktdkJysJXErMCpiSPshXG9nuhB9H
	OIhs3fFn1yFwzbrcxCS9tQdog7XndwLC66L3+4IYdFcRq72ZhtXSg+Opd4dbXBB+IED
	EKqe/bBdhx6EAAgXiV19kA+rgjngHvu7LW1hrWaM=
Content-Type: multipart/mixed; boundary="===============6484857708853346448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 068dd892acb22dc21d9e17691266c8499ba2d6c8
 SUCCEEDED
Message-ID: <0101019e2bcbab30-60865412-6550-4303-859e-746d619586cd-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237109

--===============6484857708853346448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *068dd892acb22dc21d9e17691266c8499ba2d6c8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From 24757c68de7ca8d77cce1658c5039a07f6da550b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 07:20:05 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d2f61c2098..351ef26003 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
+SRCREV = "068dd892acb22dc21d9e17691266c8499ba2d6c8"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============6484857708853346448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 104588616 to 106679464 (+2%)
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+eab8a9f92d-r0'])", added "gn (['= 0+git0+068dd892ac-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3214700 to 3222034 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+eab8a9f92d-r0'])", added "gn-dev (['= 0+git0+068dd892ac-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3809464 to 3813560 (+0%)

--===============6484857708853346448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+eab8a9f92d-r0'])", added "gn (['= 0+git0+068dd892ac-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+eab8a9f92d-r0'])", added "gn-dev (['= 0+git0+068dd892ac-r0'])"
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+eab8a9f92d to 0+git0+068dd892ac

--===============6484857708853346448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSAyNDc1N2M2OGRlN2NhOGQ3N2NjZTE2NThjNTAzOWEwN2Y2ZGE1NTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDc6MjA6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IGQyZjYxYzIwOTgu
LjM1MWVmMjYwMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgREVQRU5EUyArPSAibmluamEtbmF0aXZlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiZWFiOGE5ZjkyZGNhOWI4NTQ4YTg5ZDllNWViNmFl
YjhhYzZiYmE3NyIKK1NSQ1JFViA9ICIwNjhkZDg5MmFjYjIyZGMyMWQ5ZTE3NjkxMjY2Yzg0OTli
YTJkNmM4IgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============6484857708853346448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-4fb5a5f4004ef56097aee45767bfd36d1fe374a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:4fb5a5f4004ef56097aee45767bfd36d1fe374a2"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 141 Local 130 Mirrors 0 Missed 11 Current 281 (92% match, 97% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 314 of 422 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 959 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_fetch)
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gn-0+git-r0: task do_fetch: Started
NOTE: recipe gn-0+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1055 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_unpack)
NOTE: Running task 1056 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gn-0+git-r0: task do_unpack: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gn-0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_patch)
NOTE: recipe gn-0+git-r0: task do_patch: Started
NOTE: recipe gn-0+git-r0: task do_patch: Succeeded
NOTE: Running task 1058 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1059 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic)
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Started
NOTE: recipe gn-0+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_lic unihash changed to 32e669a88727ba263a70b54286ad69cf4555b4e66cecdf2c8872bb05d50a2cf6
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1060 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_configure)
NOTE: recipe gn-0+git-r0: task do_configure: Started
NOTE: recipe gn-0+git-r0: task do_configure: Succeeded
NOTE: Running task 1061 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_compile)
NOTE: recipe gn-0+git-r0: task do_compile: Started
NOTE: recipe gn-0+git-r0: task do_compile: Succeeded
NOTE: Running task 1062 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_install)
NOTE: recipe gn-0+git-r0: task do_install: Started
NOTE: recipe gn-0+git-r0: task do_install: Succeeded
NOTE: Running task 1063 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package)
NOTE: Running task 1064 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot)
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_package: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to 80cd9e1cd19d5bde3a77bc207fcfb70a69248f81bb9d4c4a0657ab9a5b31959d
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Running task 1065 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1065 tasks of which 1053 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515071821.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515071821.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.196737
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+eab8a9f92d-r0 to 0:0+git0+068dd892ac-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.196737
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata) failed with exit code '1'

--===============6484857708853346448==--

