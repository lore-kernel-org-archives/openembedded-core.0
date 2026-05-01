Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C68CD342A
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15710.1777645532874758684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3vtw+Tik;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3WbctHmj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019de3ee441c-6d93a9ed-7082-407c-9c49-9d91c5c93331-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NQditKd1e7nktiZYq3laBaP3TmCt+vBWdKSs0bTDWME=;
	b=3vtw+Tiky0Ug9NF0lD0Wl/Ml+fmgIDjPQbunQdB6Wuhbj8ae/ji21cM4E0YxNCjZ
	tWmvSBzlQ+X6rtbKQQq6tFNslCrVJCJmBq31Qp9d3yqHLBYhhI5EThXrmW5vV1HoF9y
	ieHPqh/5PHvmrfJ+8r2odW8Wt9KSb5yx09VVoldQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NQditKd1e7nktiZYq3laBaP3TmCt+vBWdKSs0bTDWME=;
	b=3WbctHmjhx9LVKsn7CuOqoqeG9hrd+fcRXoR+u1iPOWXpfYaHWxAMe2p0u0xD7Jf
	FFiCSTq+j6rehljQLAiaw3/sOQvVIJGCCLLxzJ/ALdyvReGAhZEREzIVaPFpZaCJp1q
	DrRUS6W5Vo2ydBMPcBEza3M6cG3Z0qCsCoGpXCrY=
Content-Type: multipart/mixed; boundary="===============6044234539207530379=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77
 SUCCEEDED
Message-ID: <0101019de3ee441c-6d93a9ed-7082-407c-9c49-9d91c5c93331-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236222

--===============6044234539207530379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77* has Succeeded.

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
From 5014588ed366272e80548e9f3c413c5915e7f6ee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 07:25:03 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 8d2c0821a0..d2f61c2098 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "ec56d4d935a0e2ab9d52b88dd00c93ec51233055"
+SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============6044234539207530379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+ec56d4d935-r0'])", added "gn (['= 0+git0+eab8a9f92d-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+ec56d4d935-r0'])", added "gn-dev (['= 0+git0+eab8a9f92d-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d

--===============6044234539207530379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-61e008d736b240043c15b3a05fa60ccdc9494436"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:61e008d736b240043c15b3a05fa60ccdc9494436"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 151 Local 140 Mirrors 0 Missed 11 Current 271 (92% match, 97% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 327 of 422 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_create_recipe_spdx_setscene)
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to ffcf428d829d16b68aa558fd22add081921db1bc62fbad7d24edcd4ce7dd07f5
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Running task 1065 of 1072 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1065 tasks of which 1053 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501072328.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501072328.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.3985679
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+ec56d4d935-r0 to 0:0+git0+eab8a9f92d-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata.3985679
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata) failed with exit code '1'

--===============6044234539207530379==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSA1MDE0NTg4ZWQzNjYyNzJlODA1NDhlOWYzYzQxM2M1OTE1ZTdmNmVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNzoyNTowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z24vZ25fZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIKaW5kZXggOGQyYzA4MjFhMC4u
ZDJmNjFjMjA5OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCkBAIC03LDcgKzcsNyBA
QCBERVBFTkRTICs9ICJuaW5qYS1uYXRpdmUiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ24uZ29vZ2xlc291cmNlLmNvbS9nbjtwcm90b2NvbD1odHRw
czticmFuY2g9bWFpbiIKLVNSQ1JFViA9ICJlYzU2ZDRkOTM1YTBlMmFiOWQ1MmI4OGRkMDBjOTNl
YzUxMjMzMDU1IgorU1JDUkVWID0gImVhYjhhOWY5MmRjYTliODU0OGE4OWQ5ZTVlYjZhZWI4YWM2
YmJhNzciCiBQViA9ICIwK2dpdCIKIAogQkJfR0lUX1NIQUxMT1cgPSAiIgotLSAKMi40Ny4xCgo=

--===============6044234539207530379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 102634872 to 104588616 (+2%)
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+ec56d4d935-r0'])", added "gn (['= 0+git0+eab8a9f92d-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3180177 to 3214700 (+1%)
packages/x86-64-v3-poky-linux/gn/gn-src: FILELIST: added "/usr/src/debug/gn/0+git/src/gn/function_expand_directory.cc /usr/src/debug/gn/0+git/src/base/files/file_path_posix.cc /usr/src/debug/gn/0+git/src/gn/command_suggest.cc"
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+ec56d4d935-r0'])", added "gn-dev (['= 0+git0+eab8a9f92d-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3731640 to 3809464 (+2%)
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+ec56d4d935 to 0+git0+eab8a9f92d

--===============6044234539207530379==--

